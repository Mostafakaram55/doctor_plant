
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/resources/chang_theme_bloc.dart';
import '../../../../core/resources/change_states.dart';
import 'descrabtion_data.dart';
class Steps extends StatelessWidget {
     const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ChangeAppMode,ChangeStates>(
      builder: (context,state){
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text(
              'Crop consultant',
              style: GoogleFonts.acme(
                  color: ColorManager.buttonColor
              ),
            ),
            backgroundColor:Theme.of(context).primaryColor,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                IconBroken.Arrow___Left,
                size: AppSize.s24.sp,
                color: ColorManager.buttonColor,
              ),
            ),
            actions: [
              IconButton(onPressed: (){
                ChangeAppMode.get(context).changeLang();
              }, icon: Icon(
               Icons.language,
                size: AppSize.s30.sp,
                color: ColorManager.buttonColor,
              ))
            ],
          ),
          body: GridView.builder(
            physics:const BouncingScrollPhysics(),
            itemCount: TextManager.stepsData['data']!.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
            ) ,
            itemBuilder:(context,index)=>GestureDetector(
              onTap:(){
                Navigator.push(context, PageTransition(
                  type: PageTransitionType.fade,
                  child: Descrabtion(
                    title: ChangeAppMode.get(context).lang? TextManager.stepsData['data']![index]['name']!:TextManager.stepsData['data']![index]['nameArabic']!,
                    text:  ChangeAppMode.get(context).lang? TextManager.stepsData['data']![index]['description']!:TextManager.stepsData['data']![index]['ArabicDescription']!,
                    image: TextManager.stepsData['data']![index]['num_image']!,
                  ),
                )
                );
              },
              child: stepItem(
                TextManager.stepsData['data']![index]['num_image'],
                Theme.of(context).backgroundColor,
                ChangeAppMode.get(context).lang? TextManager.stepsData['data']![index]['name']!:TextManager.stepsData['data']![index]['nameArabic']!,
              ),
            ),
          ),
        );
      },
    );
  }
  Widget stepItem(image,color,text){
    return  Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(AppSize.s16.sp),
         color: color,
       ),
      margin: EdgeInsets.all(AppSize.s10.sp),
      width: 169.w,
      height: 169.h,
      child: Padding(
        padding:  EdgeInsets.all(8.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Image.asset(
                 image,
              height: 100.h,
              width: 128.w,
            ),
            const Spacer(),
            Text(
                '$text' ,
              maxLines: 3,
              style: GoogleFonts.acme(
                color: ColorManager.buttonColor,
                fontSize: FontSize.s20.sp,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
    );
  }

}
