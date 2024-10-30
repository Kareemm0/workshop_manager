import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';
import 'package:workshop_manager/Core/widget/custom_container_button.dart';
import 'package:workshop_manager/Feature/about_workshop/presentation/widgets/custom_rating_container_widget.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';

class CustomWorkshopRatingView extends StatelessWidget {
  final String name;
  final String maintainType;
  final String pic;
  final String date;
  final String review;
  final int? itemCount;
  const CustomWorkshopRatingView({
    super.key,
    required this.name,
    required this.maintainType,
    required this.pic,
    required this.date,
    required this.review,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomAppText(
            text: "التقييمات",
            size: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
          height(12),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CustomRatingContainerWidget(
                    name: name,
                    maintainType: maintainType,
                    pic: pic,
                    date: date,
                    review: review);
              },
            ),
          ),
          const CustomContainerButton(
            text: 'احجز ',
          )
          // WhiteContainer(
          //   widget: DefaultButton(
          //     width: MediaQuery.sizeOf(context).width * 0.9,
          //     height: MediaQuery.sizeOf(context).height * 0.06,
          //     containerColor: AppColors.primary,
          //     title: ,
          //     onPressed: () {
          //       context.push(Routes.orderSummary);
          //     },
          //   ),
          // ),
        ],
      ),
    ));
  }
}
