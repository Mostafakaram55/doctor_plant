
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({Key? key, required this.assetImage, required this.radius, required this.textOption}) : super(key: key);
final String assetImage;
final String textOption;
final double radius;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppSize.s20.sp),
      child: Material(
        borderRadius: BorderRadius.circular(AppSize.s6.sp),
        elevation: 2,
        child: Container(
          width: AppSize.s357.w,
          height: AppSize.s53.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: ColorManager.secondColor,
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image:AssetImage(assetImage),
                alignment: AlignmentDirectional.center,
                height: AppSize.s29.h,
                width: AppSize.s29.h,
              ),
              SizedBox(width: AppSize.s4.sp),
              Text(
                  textOption,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s14.sp
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
