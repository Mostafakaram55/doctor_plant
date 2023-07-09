import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultButton({
  double w=AppSize.s357,
  double h=AppSize.s53,
  dynamic function,
  Color?  color,
  String? text,
  BorderRadius? borderRadius,
 // Color? borderColor,
  Color? textColor=Colors.white,
})=> Container(
  width:w.w ,
  height: h.h,
  decoration: BoxDecoration(
    borderRadius: borderRadius,
    color: color,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text!.toUpperCase(),
      style: TextStyle(
        color:  textColor,
        fontSize: AppSize.s18.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);