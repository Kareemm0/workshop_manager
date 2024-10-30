import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/constant/app_sized.dart';
import 'package:workshop_manager/Core/constant/constant.dart';
import 'package:workshop_manager/Core/func/show_toast.dart';
import 'package:workshop_manager/Core/widget/custom_app_button.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';
import 'package:workshop_manager/Core/widget/custom_loader_widget.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/cubit/order_details_cubit.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/widget/custom_container_row_buttons.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/widget/custom_container_workshop_information_and_location.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/widget/custom_date_row.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/widget/custom_services_list_view_body.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/widget/custom_total_price_row.dart';
import 'package:workshop_manager/Feature/location_on_map/presentation/cubit/location_on_map_cubit.dart';
import 'package:workshop_manager/Feature/scanner_page/presentation/cubit/scanner_cubit.dart';
import 'package:workshop_manager/di.dart';
import '../../../../Core/app/routes.dart';
import '../../../../Core/func/date.dart';
import '../../../../Core/utils/app_colors.dart';
import '../widget/custom_cancel_order_reason.dart';
import '../widget/custom_cancel_popup.dart';
import '../widget/custom_car_info.dart';
import '../widget/custom_conatiner_app_bar.dart';
import '../widget/custom_row_update_order_status.dart';
import '../widget/custom_user_row_info.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int id;
  const OrderDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            OrderDetailsCubit(getIt())..orderDetails(id.toString()),
        child: MultiBlocListener(
          listeners: [
            BlocListener<OrderDetailsCubit, OrderDetailsState>(
                listener: (context, state) {
              (context, state) {
                if (state is CancelOrderSuccessState) {
                  showToast(message: "Order Cancelled Successfully");
                  context.push(Routes.workshopOrders);
                } else if (state is CancelOrderFailureState) {
                  showToast(message: state.message);
                }
              };
            }),
            BlocListener<ScannerCubit, ScannerState>(
              listener: (context, state) {
                if (state is ScannerSuccessState) {
                  showToast(message: "Change Order Status Successfully");
                } else if (state is ScannerFailureState) {
                  showToast(message: state.message);
                }
              },
            )
          ],
          child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
              builder: (context, state) {
            final cubit = context.read<OrderDetailsCubit>();
            final status = context.read<ScannerCubit>();
            final location = context.read<LocationOnMapCubit>();
            return Scaffold(
              body: state is OrderDetailsSuccessState
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 34),
                      child: Column(
                        children: [
                          const CustomConatinerAppBar(),
                          height(16),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: CustomAppText(
                                        text: cubit.pendding ==
                                                state.orders.status
                                            ? "طلب خدمة جديد"
                                            : cubit.finished ==
                                                    state.orders.status
                                                ? "طلب خدمة المنتهية"
                                                : "",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    height(16),
                                    CustomContainerWorkshopInformationAndLocation(
                                      workshopImage:
                                          state.orders.client!.user!.avatar ??
                                              image,
                                      workshopname:
                                          state.orders.workshop!.name!,
                                      gove: state
                                          .orders.workshop!.government!.arName!,
                                      city: state
                                          .orders.workshop!.center!.arName!,
                                    ),
                                    height(16),
                                    const CustomAppText(
                                      text: "تاريخ الحجز",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(8),
                                    CustomDateRow(
                                      date:
                                          getDateOnly(state.orders.createdAt!),
                                      status: state.orders.status!,
                                      calenderColor: cubit.pendding ==
                                              state.orders.status
                                          ? AppColors.orange
                                          : cubit.working == state.orders.status
                                              ? AppColors.green
                                              : AppColors.grey9C,
                                      statusColor: cubit.pendding ==
                                              state.orders.status
                                          ? AppColors.orange
                                          : cubit.working == state.orders.status
                                              ? AppColors.green
                                              : AppColors.grey9C,
                                    ),
                                    height(16),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.greyEE,
                                      ),
                                      child: Column(
                                        children: [
                                          const CustomRowUpdateOrderStatus(),
                                          SizedBox(
                                            height: heightSize(context) * 0.2,
                                            child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) =>
                                                      height(16),
                                              itemBuilder: (context, index) {
                                                return state
                                                            .orders
                                                            .services![index]
                                                            .pivot
                                                            .status ==
                                                        cubit.initial
                                                    ? CustomServicesListViewBody(
                                                        serviceName: state
                                                            .orders
                                                            .services![index]
                                                            .arName,
                                                        price: state
                                                            .orders
                                                            .services![index]
                                                            .pivot
                                                            .price
                                                            .toString(),
                                                      )
                                                    : Container();
                                              },
                                              itemCount:
                                                  state.orders.services!.length,
                                            ),
                                          ),
                                          const Divider(
                                            color: AppColors.grey9,
                                            thickness: 2,
                                          ),
                                          height(16),
                                          CustomTotalPriceRow(
                                            totalPrice: state.orders.totalPrice
                                                .toString(),
                                          )
                                        ],
                                      ),
                                    ),
                                    height(16),
                                    cubit.working == state.orders.status
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const CustomAppText(
                                                text: "الصيانة المقترحة",
                                                fontWeight: FontWeight.w700,
                                                size: 16,
                                              ),
                                              ...List.generate(
                                                  state.orders.services!.length,
                                                  (index) {
                                                return state
                                                            .orders
                                                            .services![index]
                                                            .pivot
                                                            .status ==
                                                        cubit.servicePendding
                                                    ? Column(
                                                        children: [
                                                          height(8),
                                                          CustomServicesListViewBody(
                                                            price: state
                                                                .orders
                                                                .services![
                                                                    index]
                                                                .pivot
                                                                .price
                                                                .toString(),
                                                            serviceName: state
                                                                .orders
                                                                .services![
                                                                    index]
                                                                .arName,
                                                          ),
                                                        ],
                                                      )
                                                    : const SizedBox();
                                              })
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const CustomAppText(
                                                text: "بيانات العميل",
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.primary,
                                              ),
                                              height(8),
                                              CustomUserRowInfo(
                                                userImage: state.orders.client!
                                                        .user!.avatar ??
                                                    image,
                                                userId: state.orders.client!.id
                                                    .toString(),
                                                userName: state
                                                    .orders.client!.user!.name!,
                                              ),
                                              height(16),
                                              const CustomAppText(
                                                text: "نوع السيارة",
                                                fontWeight: FontWeight.w700,
                                              ),
                                              height(4),
                                              CustomCarInfo(
                                                carLogo: state.orders.car!
                                                        .brand!.logo ??
                                                    image,
                                                transmissionType: state.orders
                                                    .car!.transmissionType!,
                                                modelYear: state
                                                    .orders.car!.modelYear!,
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          cubit.pendding == state.orders.status
                              ? CustomContainerRowButtons(
                                  onPressedOne: () {
                                    context.pushNamed(Routes.scanner,
                                        pathParameters: {
                                          "id": id.toString(),
                                        });
                                  },
                                  onPressedTwo: () {
                                    cancelDialog(
                                      context: context,
                                      onPressed: () {
                                        cancellationReason(
                                          context: context,
                                          onPressed: () {
                                            cubit.cancelOrder(
                                                state.orders.id.toString());
                                          },
                                        );
                                      },
                                    );
                                  },
                                  textone: "تأكيد الحجز",
                                  texttwo: "رفض الحجز",
                                )
                              : cubit.working == state.orders.status
                                  ? CustomContainerRowButtons(
                                      onPressedOne: () {
                                        status.scanner(
                                          state.orders.id.toString(),
                                          lat: location
                                              .currentPosition!.latitude
                                              .toString(),
                                          lng: location
                                              .currentPosition!.longitude
                                              .toString(),
                                          method: "PUT",
                                          status: "finished",
                                        );
                                      },
                                      onPressedTwo: () {
                                        context.pushNamed(
                                          Routes.suggestedService,
                                          pathParameters: {
                                            "id": state.orders.workshop!.id
                                                .toString(),
                                          },
                                          extra: id.toString(),
                                        );
                                      },
                                      textone: "انهاء الخدمة",
                                      texttwo: "اقترح خدمة",
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: CustomAppButton(
                                        radius: 24,
                                        text: "العودة للصفحة الرئيسية",
                                        width: double.maxFinite,
                                        onPressed: () {
                                          context.push(Routes.navbar);
                                        },
                                      ),
                                    ),
                        ],
                      ),
                    )
                  : state is OrderDetailsFailureState
                      ? Center(
                          child: CustomAppText(
                            text: state.message,
                            fontWeight: FontWeight.w700,
                            size: 18,
                            color: AppColors.primary,
                          ),
                        )
                      : const Center(child: CustomLoaderWidget()),
            );
          }),
        ));
  }
}
