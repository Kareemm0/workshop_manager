import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';

InputBorder outLineInputBorder({
  Color? color,
}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? AppColors.grey9));
}
