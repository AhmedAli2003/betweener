import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static OutlineInputBorder primaryRoundedOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: AppColors.kPrimaryColor,
      width: 2,
    ),
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimaryColor,
  );
}
