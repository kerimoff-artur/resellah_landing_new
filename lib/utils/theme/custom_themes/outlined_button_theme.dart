import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.darkContainerColor,  
      backgroundColor: AppColors.greenprimaryColor,
      side: const BorderSide(color: Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(color: AppColors.darkContainerColor, fontSize: 18, fontWeight: FontWeight.w800),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.whiteContainerColor,
      backgroundColor: AppColors.greenprimaryColor,
      side: const BorderSide(color: Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(color: AppColors.whiteContainerColor, fontSize: 18, fontWeight: FontWeight.w800),
    ),
  );
}