
import 'package:doctor_plant/core/funcations/custom_Button.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SliverBody extends StatelessWidget {
  const SliverBody({Key? key, required this.prediction, required this.confidence,}) : super(key: key);
  final String prediction;

  final double confidence;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppSize.s12.sp,vertical: AppSize.s12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            TextManager.diseaseName ,
            style: GoogleFonts.montserrat(
              fontSize: FontSize.s25.sp,
              color: ColorManager.buttonColor,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                prediction,
                style: GoogleFonts.montserrat(
                    fontSize: FontSize.s16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.descriptionColor
                ),
              ),
              const Spacer(),
              Text(
                '$confidence %',
                style: GoogleFonts.montserrat(
                    fontSize: FontSize.s30.sp,
                    fontWeight: FontWeight.w600,
                  color:Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
              TextManager.description,
            style: GoogleFonts.montserrat(
              color:Theme.of(context).disabledColor,
              fontSize: FontSize.s18,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            prediction=='Potato__Early_blight'?TextManager.descriptionEarly:TextManager.descriptionLate,
            textAlign: TextAlign.justify,
            maxLines: 9,
            style: GoogleFonts.montserrat(
              fontSize: FontSize.s16,
              color: Theme.of(context).splashColor,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(
            height: AppSize.s22.h,
          ),
        ],
      ),
    );
  }
}
