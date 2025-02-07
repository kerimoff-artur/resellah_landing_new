import 'package:flutter/material.dart';
import 'package:resellah_landing_new/utils/constrants/colors.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._();

  static CheckboxThemeData get lightCheckboxTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return AppColors.whitesecondaryColor;
      } else {
        return AppColors.whitesecondaryColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return AppColors.orangeContainerColor;
      } else {
        return AppColors.orangeContainerColor;
      }
    }),
  );

  static CheckboxThemeData get darkCheckboxTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return AppColors.whitesecondaryColor;
      } else {
        return AppColors.whitesecondaryColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return AppColors.orangeContainerColor;
      } else {
        return AppColors.whitesecondaryColor;
      }
    }),
  );
}

