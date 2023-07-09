
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/text_Manager.dart';
import '../resources/values_Manager.dart';

class EditProfileShimmer extends StatelessWidget {
  const EditProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal: AppSize.s16.sp,vertical: AppSize.s10.sp ),
              child: Row(
                children: [
                  Shimmer.fromColors(
                      baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
                      highlightColor:Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: AppSize.s16.sp,
                      )
                  ),
                  Shimmer.fromColors(
                      baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
                      highlightColor:Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: AppSize.s16.sp,
                      )
                  ),
                  SizedBox(width: AppSize.s8.w,),
                  Shimmer.fromColors(
                      baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
                      highlightColor:Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: AppSize.s16.sp,
                      )
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.sp,
              color: Theme.of(context).backgroundColor,
            ),
            Shimmer.fromColors(
                baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
                highlightColor:Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: AppSize.s82.sp,
                )
            ),
            SizedBox(height: AppSize.s20.h,),
            Shimmer.fromColors(
              baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
              highlightColor:Theme.of(context).primaryColor,
              child: Container(
                width: 30,
                height: 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Shimmer.fromColors(
              baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
              highlightColor:Theme.of(context).primaryColor,
              child: Container(
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Shimmer.fromColors(
              baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
              highlightColor:Theme.of(context).primaryColor,
              child: Container(
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
