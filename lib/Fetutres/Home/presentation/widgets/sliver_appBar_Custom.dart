

import 'dart:io';

import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({Key? key, required this.imagePath, }) : super(key: key);
  final File imagePath;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      leading:Container(
        margin:  EdgeInsets.only(left: AppMargin.m20.sp),
        width: AppSize.s60.w,
        height: AppSize.s60.h,
        decoration: BoxDecoration(
          shape:  BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: IconButton(
          onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context);
          },
          icon:Icon(
            IconBroken.Arrow___Left,
            color: ColorManager.buttonColor,
          ),
        ),
      ),
      expandedHeight: 300.sp,
      flexibleSpace: FlexibleSpaceBar(
        background:  Image.file(
          imagePath,
          fit: BoxFit.cover,
        ),
        stretchModes:const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      bottom: PreferredSize(
        preferredSize:  Size.fromHeight(0.0.sp),
        child: Container(
          height: AppSize.s30.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:  BorderRadius.only(
                topRight: Radius.circular(AppSize.s30.sp),
                topLeft: Radius.circular(AppSize.s30.sp)
            ),
          ),
        ),
      ),

    );
  }
}
