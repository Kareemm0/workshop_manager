import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/app/routes.dart';
import 'package:workshop_manager/Core/func/show_toast.dart';
import 'package:workshop_manager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import 'package:workshop_manager/Feature/EditWorkshopProfile/presentation/widget/custom_edit_workshop_images.dart';
import 'package:workshop_manager/di.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_bar.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../widget/custom_edit_workshop_information_fileds.dart';

class EditWorkshopProfileScreen extends StatelessWidget {
  final int id;
  const EditWorkshopProfileScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditWorkshopProfileCubit(getIt()),
      child: BlocConsumer<EditWorkshopProfileCubit, EditWorkshopProfileState>(
        listener: (context, state) {
          if (state is EditWorkshopProfilSuccessState) {
            showToast(message: "Updated Successfully");
            context.push(Routes.navbar);
          } else if (state is EditWorkshopProfileFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<EditWorkshopProfileCubit>();
          return Scaffold(
            appBar: appBar(
              title: "الاعدادات ",
              textColor: AppColors.black13,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
                          const CustomEditWorkshopImages(),
                          height(24),
                          const CustomEditWorkshopInformationFileds(),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomContainerButton(
                  text: "حفظ",
                  onPressed: () {
                    cubit.editWorkshop(id.toString());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
