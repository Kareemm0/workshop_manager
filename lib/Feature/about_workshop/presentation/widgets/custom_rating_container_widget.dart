import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/constant/app_sized.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';

import '../../../../Core/utils/app_colors.dart';

class CustomRatingContainerWidget extends StatelessWidget {
  final String name;
  final String maintainType;
  final String pic;
  final String date;
  final String review;
  const CustomRatingContainerWidget({
    super.key,
    required this.name,
    required this.maintainType,
    required this.pic,
    required this.date,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey4B, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppText(
                text: maintainType,
                size: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.grey4B,
              ),
              Row(
                children: [
                  CustomAppText(
                    text: name,
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey4B,
                  ),
                  width(6),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(pic, width: 60, height: 60)),
                ],
              ),
            ],
          ),
          height(12),
          CustomAppText(
            text: date,
            size: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.grey4B,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.star, color: AppColors.orange),
                  Icon(Icons.star, color: AppColors.orange),
                  Icon(Icons.star, color: AppColors.orange),
                  Icon(Icons.star, color: AppColors.orange),
                ],
              ),
              CustomAppText(
                text: review,
                size: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey4B,
              ),
            ],
          )
        ],
      ),
    );
  }
}
