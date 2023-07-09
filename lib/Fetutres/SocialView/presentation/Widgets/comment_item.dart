
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:[
        Expanded(
          child: InkWell(
            onTap:(){
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s20.sp,
                  backgroundImage: const AssetImage(AssetsData.tata),
                ),
                SizedBox(width: AppSize.s14.w,),
                Text(
                  TextManager.writeComment,
                  style: GoogleFonts.montserrat(
                      color: ColorManager.descriptionColor
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Row(
            children:  [
              const Icon(
                IconBroken.Heart,
                color: Colors.redAccent,
              ),
              Text(
                ' Like',
                style: GoogleFonts.montserrat(
                    fontSize: AppSize.s13.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.descriptionColor
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
