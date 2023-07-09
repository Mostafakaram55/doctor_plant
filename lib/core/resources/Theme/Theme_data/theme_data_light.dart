import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Text_style_manager.dart';
ThemeData getThemeDataLight()=>ThemeData(
  disabledColor: ColorManager.black,
  backgroundColor: ColorManager.secondColor,
  splashColor: ColorManager.descriptionColor,
  primaryColor: ColorManager.primary,
  cardColor: ColorManager.descriptionColor,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManager.buttonColor,
    splashColor: ColorManager.buttonColor,
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: ColorManager.primary,
    elevation: 20,
    selectedItemColor:ColorManager.buttonColor,
    unselectedItemColor:ColorManager.gray,
  ),
  textTheme: TextTheme(
    headlineLarge: getLightStyle(color: ColorManager.textProfile,fontSize:FontSize.s22.sp),
    displayLarge: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s20.sp),
    titleMedium: getMediumStyle(color:ColorManager.gray,fontSize: FontSize.s20.sp),
    headlineMedium:getMediumStyle(color:ColorManager.darkGray,fontSize: FontSize.s14.sp),
    bodyLarge: getRegularStyle(color: ColorManager.buttonColor,fontSize: FontSize.s25.sp),
    bodySmall: getRegularStyle(color:ColorManager.gray,fontSize: FontSize.s20.sp),
    labelMedium: getMediumStyle(color:ColorManager.black,fontSize: FontSize.s12.sp),
    titleSmall:getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s12.sp),
    labelLarge: getSemiBoldTextStyle(color: ColorManager.black,fontSize: FontSize.s40.sp)
  ),
);