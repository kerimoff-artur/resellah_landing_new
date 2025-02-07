import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.darkContainerColor,  
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(color: AppColors.darkContainerColor, fontSize: 18, fontWeight: FontWeight.w800),
    ),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.whiteContainerColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(color: AppColors.whiteContainerColor, fontSize: 18, fontWeight: FontWeight.w800),
    ),
  );
}