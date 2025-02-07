import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';


class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.orangeContainerColor,
      foregroundColor: AppColors.whiteContainerColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
      side: const BorderSide(color: AppColors.orangeContainerColor),
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
    ),
  );

static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.orangeContainerColor,
    foregroundColor: AppColors.whiteContainerColor,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
    side: const BorderSide(color: AppColors.orangeContainerColor),
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
  ),
);
}


