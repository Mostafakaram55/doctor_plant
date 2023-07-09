
import 'dart:ui';
import 'package:doctor_plant/Fetutres/SocialView/presentation/Widgets/comment_item.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ccount_rating_widget.dart';
class ItemSocial extends StatelessWidget {
  const ItemSocial({Key? key, required this.name, required this.dateAndTime, required this.text}) : super(key: key);
  final String name;
  final String dateAndTime;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.all(AppSize.s8.sp),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      child: Padding(
        padding:  EdgeInsets.all(AppSize.s12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s24.sp,
                  backgroundImage:const  AssetImage(AssetsData.tata),
                ),
                SizedBox(width: AppSize.s14.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        name,
                        style: TextStyle(
                          height: 1.3.h,
                          color: ColorManager.buttonColor,
                          fontSize: AppSize.s16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                          dateAndTime,
                        style: TextStyle(
                          height: 1.3.h,
                          fontSize: AppSize.s12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.descriptionColor
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSize.s14.w,),
                IconButton(
                  iconSize: AppSize.s22.sp,
                    onPressed: (){}, icon:Icon(
                  IconBroken.More_Square,
                  color: Theme.of(context).disabledColor,
                ))
              ],
            ),
            Divider(
              height:AppSize.s18.h,
              thickness: 1,
            ),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: AppSize.s16.sp,
                height: 1.h,
                color: Theme.of(context).disabledColor,
              ),
            ),
            SizedBox(height: AppSize.s6.h,),
            Container(
              height: AppSize.s150.h,
              width: double.infinity.w,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8.sp),
                image: const DecorationImage(
                  image:AssetImage(AssetsData.test),
                )
              ),
            ),
            Padding(
               padding: EdgeInsets.symmetric(vertical: AppSize.s4.sp),
               child: Row(
                children: [
                  CountWidget(
                    mainAxisAlignment: MainAxisAlignment.start,
                    icon: IconBroken.Heart,
                    function: (){},
                    count: '44',
                  ),
                  CountWidget(
                    mainAxisAlignment: MainAxisAlignment.center,
                    icon: IconBroken.Send,
                    function: (){},
                    count: '89',
                  ),
                  CountWidget(
                    mainAxisAlignment: MainAxisAlignment.end,
                    icon: IconBroken.Chat,
                    function: (){},
                    count: '1232',
                  ),
                ],
            ),
             ),
            Divider(
              height:AppSize.s18.h,
              thickness: 1,
            ),
            const CommentItem(),
          ],
        ),
      ),
    );
  }
}
