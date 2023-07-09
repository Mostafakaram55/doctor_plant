
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomItemSetting extends StatelessWidget {
  const CustomItemSetting({Key? key, required this.title, required this.iconData, required this.widget}) : super(key: key);
  final String title;
  final IconData iconData;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding:  EdgeInsets.all(AppSize.s8.sp),
        child: Row(
          children: [
           Expanded(
             child: Row(
               children: [
                 Icon(
                     iconData,
                    size: AppSize.s30.sp,
                   color: ColorManager.buttonColor,
                 ),
                 SizedBox(
                   width: AppSize.s8.w,
                 ),
                 Text(
                   title,
                   style: GoogleFonts.montserrat(
                       fontSize: AppSize.s16.sp,
                       fontWeight: FontWeight.w500,
                     color:Theme.of(context).disabledColor
                   ),
                 )
               ],
             ),
           ),
            widget,
          ],
        ),
      ),
    );
  }
}
