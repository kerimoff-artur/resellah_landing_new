import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/text_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/text_field_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/chip_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/appbar_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';
import 'package:resellah_landing_new/utils/theme/custom_themes/text_button.dart';


class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 204, 75, 53),
    scaffoldBackgroundColor: AppColors.whitesecondaryColor,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
  );
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 204, 75, 53),
    scaffoldBackgroundColor: AppColors.darkquinaryColor,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,  
  );
}


