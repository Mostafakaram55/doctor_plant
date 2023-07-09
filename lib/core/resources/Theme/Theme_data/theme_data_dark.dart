import 'package:doctor_plant/core/resources/color_Manager_dark.dart';
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Text_style_manager.dart';
dynamic getThemeDataDark()=>ThemeData(
  disabledColor: ColorManagerDark.textColor,
  backgroundColor: ColorManagerDark.buttonNavigationBarIcon,
  splashColor: ColorManagerDark.lightGrayOver,
  cardColor: ColorManagerDark.buttonColor,
  primaryColor: ColorManagerDark.primary,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManagerDark.buttonColor,
    splashColor: ColorManagerDark.buttonColor,
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: ColorManagerDark.buttonNavigationBarIcon,
    elevation: 20,
    selectedItemColor:ColorManagerDark.buttonColor,
    unselectedItemColor:ColorManagerDark.lightGrayOver,
  ),
  textTheme:TextTheme(
    headlineLarge: getLightStyle(color: ColorManagerDark.textColor,fontSize:FontSize.s22.sp),
    displayLarge: getBoldStyle(color: ColorManagerDark.lightGrayOver,fontSize: FontSize.s20.sp),
    titleMedium: getMediumStyle(color:ColorManagerDark.textColor,fontSize: FontSize.s16.sp),
    headlineMedium:getMediumStyle(color:ColorManagerDark.secondTextColor,fontSize: FontSize.s14.sp),
      bodyLarge: getRegularStyle(color: ColorManagerDark.buttonNavigationBarIcon,fontSize: FontSize.s25.sp),
    bodySmall: getRegularStyle(color:ColorManagerDark.gray),
    labelMedium: getMediumStyle(color:ColorManagerDark.textColor,fontSize: FontSize.s12.sp),
    titleSmall:getSemiBoldStyle(color: ColorManagerDark.textColor,fontSize: FontSize.s12.sp),
      labelLarge: getSemiBoldTextStyle(color: ColorManagerDark.textColor,fontSize: FontSize.s40.sp)
  ),
);