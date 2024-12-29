import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: AppColors.white,
    selectedColor: AppColors.primary,
    disabledColor: AppColors.grey.withValues(alpha : 0.4),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: const TextStyle(color: AppColors.black, fontFamily: 'Urbanist'),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    checkmarkColor: AppColors.white,
    selectedColor: AppColors.primary,
    disabledColor: AppColors.darkerGrey,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: AppColors.white, fontFamily: 'Urbanist'),
  );
}
