import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';


class MyAppBarTheme {
  MyAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.greenContainerColor,
    foregroundColor: AppColors.whitesecondaryColor,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    );

    static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.greenContainerColor,
    foregroundColor: AppColors.darkContainerColor,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    );
}

