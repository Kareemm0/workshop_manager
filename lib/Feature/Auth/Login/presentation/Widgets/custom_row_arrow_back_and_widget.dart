import 'package:flutter/material.dart';

import '../../../../../Core/utils/app_imgaes.dart';
import '../../../../../Core/widget/custom_arrow_back.dart';

class CustomRowArrowBackAndWidget extends StatelessWidget {
  const CustomRowArrowBackAndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomArrowBack(),
        Image.asset(AppImages.logo),
      ],
    );
  }
}
