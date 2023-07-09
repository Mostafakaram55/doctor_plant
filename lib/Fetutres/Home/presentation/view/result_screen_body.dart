

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/funcations/custom_Button.dart';
import '../../../../core/resources/assetse_Manager.dart';
import '../../../../core/resources/color_Manager.dart';
import '../../../../core/resources/font_Manager.dart';
import '../../../../core/resources/values_Manager.dart';
import '../widgets/sliver_appBar_Custom.dart';
import '../widgets/sliver_body_widget.dart';
class ResultViewBody extends StatelessWidget {
  const ResultViewBody(
      {
        Key? key,
        required this.imagePath,
        required this.prediction,
        required this.confidence
      })
      : super(key: key);

  final File imagePath;
  final String prediction;

  final double confidence;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
   children: [
     CustomScrollView(
       slivers:[
         SliverAppBarCustom(
           imagePath:imagePath ,
         ),
         SliverToBoxAdapter(
           child: SliverBody(
             confidence: confidence,
             prediction: prediction,
           ),
         )
       ],
     ),
     Padding(
       padding:  EdgeInsets.all(AppSize.s20.sp),
       child: defaultButton(
           color:ColorManager.buttonColor,
           borderRadius: BorderRadius.circular(AppSize.s12),
           text: 'Methods of Treatment',
           function: (){
             showBottomSheet(
                 backgroundColor: Theme.of(context).backgroundColor,
                 elevation: 8,
                 context: context, builder: (context)=>SizedBox(
               width: double.infinity,
               height: AppSize.s500.h,
               child: Column(
                 children: [
                   IconButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     icon: Icon(
                       IconBroken.Close_Square,
                       size: AppSize.s40.sp,
                       color: ColorManager.buttonColor,
                     ),
                   ),
                   ConditionalBuilder(
                     condition: prediction=='Potato__Early_blight',
                     builder: (context)=>SizedBox(
                         width: double.infinity,
                         child:  Padding(
                           padding:  EdgeInsets.all(AppSize.s20.sp),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                   'Pesticide',
                                   style: GoogleFonts.aBeeZee(
                                       color: ColorManager.buttonColor,
                                       fontSize: FontSize.s30.sp
                                   )
                               ),
                               SizedBox(
                                 height: AppSize.s4.h,
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Amistar Top pesticide:-',
                                     style: TextStyle(
                                         color:Theme.of(context).disabledColor,
                                         fontSize: FontSize.s20,
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                   Text(
                                     ' at a rate of 50 cm3 / 100 liters of water.',
                                     style: TextStyle(
                                         fontSize: AppSize.s18.sp,
                                         fontWeight: FontWeight.w400,
                                         color:Colors.grey
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(
                                 height: AppSize.s4.h,
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Pellez pesticide:-',
                                     style: TextStyle(
                                         color:Theme.of(context).disabledColor,
                                         fontSize: FontSize.s20,
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                   Text(
                                     '  at a rate of 50 g / 100 liters of water .',
                                     style: TextStyle(
                                         fontSize: AppSize.s18.sp,
                                         fontWeight: FontWeight.w400,
                                         color: Colors.grey
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(
                                 height: AppSize.s4.h,
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Score pesticide:-',
                                     style: TextStyle(
                                         color:Theme.of(context).disabledColor,
                                         fontSize: FontSize.s20,
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                   Text(
                                     ' at a rate of 50 g / 100 liters of water .',
                                     style: TextStyle(
                                         fontSize: AppSize.s18.sp,
                                         fontWeight: FontWeight.w400,
                                         color: Colors.grey
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(
                                 height: AppSize.s10.h,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   InkWell(
                                     onTap: (){
                                       openLink('https://www.youtube.com/watch?v=UM7mOoJRci4');
                                     },
                                     child: SizedBox(
                                         height: 50.h,
                                         width: 50.w,
                                         child: Image.asset(AssetsData.youtube)),
                                   ),
                                   SizedBox(width: AppSize.s10.sp,),
                                   InkWell(
                                     onTap: (){
                                       openLink('https://alfallahalyoum.news/%D9%83%D9%8A%D9%81-%D8%AA%D9%83%D8%A7%D9%81%D8%AD-%D9%85%D8%B1%D8%B6-%D8%A7%D9%84%D9%86%D8%AF%D9%88%D8%A9-%D8%A7%D9%84%D9%85%D8%AA%D8%A3%D8%AE%D8%B1%D8%A9-%D9%81%D9%8A-%D8%A7%D9%84%D8%A8%D8%B7%D8%A7.html');
                                     },
                                     child: SizedBox(
                                         height: 50.h,
                                         width: 50.w,
                                         child: Image.asset(AssetsData.global)),
                                   ),
                                 ],
                               ),
                               SizedBox(
                                 height: AppSize.s10.h,
                               ),
                               SizedBox(
                                 height: AppSize.s10.h,
                               ),
                                Divider(
                                  color: Theme.of(context).disabledColor,
                                ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'feedback',
                                     style: GoogleFonts.acme(
                                         fontSize: FontSize.s22.sp,
                                         color: Theme.of(context).disabledColor
                                     ),
                                   ),
                                   Row(
                                     children: [
                                       IconButton(onPressed: (){
                                         openLink('https://wa.me/+2001113312766');
                                       }, icon: Icon(
                                         IconBroken.Chat,
                                         color: Theme.of(context).disabledColor,
                                         size: AppSize.s30.sp,
                                       )),
                                       Text(
                                         'To contact customer service.',
                                         style: TextStyle(
                                             color: Colors.grey,
                                             fontSize: AppSize.s18.sp
                                         ),
                                       ),
                                     ],
                                   )
                                 ],
                               ),
                             ],
                           ),
                         )
                     ),
                     fallback: (context)=>SizedBox(
                       width: double.infinity,
                       child:  Padding(
                         padding:  EdgeInsets.all(AppSize.s20.sp),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               'Pesticide',
                               style: GoogleFonts.aBeeZee(
                                 color: ColorManager.buttonColor,
                                 fontSize: FontSize.s30.sp
                               )
                             ),
                             SizedBox(
                               height: AppSize.s4.h,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                     'Copper aerobatics:-',
                                   style: TextStyle(
                                     color:Theme.of(context).disabledColor,
                                     fontSize: FontSize.s20,
                                     fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 Text(
                                     ' 46% at a rate of 250 gm/100 liters of water.',
                                   style: TextStyle(
                                     fontSize: AppSize.s18.sp,
                                     fontWeight: FontWeight.w400,
                                     color:Colors.grey
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: AppSize.s4.h,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                     'Amistar:-',
                                   style: TextStyle(
                                       color:Theme.of(context).disabledColor,
                                     fontSize: FontSize.s20,
                                     fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 Text(
                                   '  25% at a rate of 50 cm/100 liters of water.',
                                   style: TextStyle(
                                       fontSize: AppSize.s18.sp,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.grey
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: AppSize.s4.h,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                     'Rivas:-',
                                   style: TextStyle(
                                       color:Theme.of(context).disabledColor,
                                       fontSize: FontSize.s20,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 Text(
                                   '  25% at a rate of 50 cm/100 liters of water.',
                                   style: TextStyle(
                                       fontSize: AppSize.s18.sp,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.grey
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: AppSize.s4.h,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                     'Belize:-',
                             style: TextStyle(
                                 color:Theme.of(context).disabledColor,
                                 fontSize: FontSize.s20,
                                 fontWeight: FontWeight.bold
                             ),),
                                 Text(
                                   ' 75gm/100 liters of water.',
                                   style: TextStyle(
                                       fontSize: AppSize.s18.sp,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.grey
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: AppSize.s10.h,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 InkWell(
                                   onTap: (){
                                     openLink('https://www.youtube.com/watch?v=UM7mOoJRci4');
                                   },
                                   child: SizedBox(
                                       height: 50.h,
                                       width: 50.w,
                                       child: Image.asset(AssetsData.youtube)),
                                 ),
                                 SizedBox(width: AppSize.s10.sp,),
                                 InkWell(
                                   onTap: (){
                                     openLink('https://alfallahalyoum.news/%D9%83%D9%8A%D9%81-%D8%AA%D9%83%D8%A7%D9%81%D8%AD-%D9%85%D8%B1%D8%B6-%D8%A7%D9%84%D9%86%D8%AF%D9%88%D8%A9-%D8%A7%D9%84%D9%85%D8%AA%D8%A3%D8%AE%D8%B1%D8%A9-%D9%81%D9%8A-%D8%A7%D9%84%D8%A8%D8%B7%D8%A7.html');
                                   },
                                   child: SizedBox(
                                       height: 50.h,
                                       width: 50.w,
                                       child: Image.asset(AssetsData.global)),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: AppSize.s10.h,
                             ),
                             Divider(
                               color: Theme.of(context).disabledColor,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                     'feedback',
                                   style: GoogleFonts.acme(
                                     fontSize: FontSize.s22.sp,
                                     color: Theme.of(context).disabledColor
                                   ),
                                 ),
                                 Row(
                                   children: [
                                     IconButton(onPressed: (){
                                       openLink('https://wa.me/+2001113312766');
                                     }, icon: Icon(
                                       IconBroken.Chat,
                                       color: Theme.of(context).disabledColor,
                                       size: AppSize.s30.sp,
                                     )),
                                      Text(
                                         'To contact customer service.',
                                       style: TextStyle(
                                         color: Colors.grey,
                                         fontSize: AppSize.s18.sp
                                       ),
                                     ),
                                   ],
                                 )
                               ],
                             ),
                           ],
                         ),
                       )
                     )
                   ),
                 ],
               ),
             ));
           },
           textColor: ColorManager.primary,
           h: AppSize.s53.h,
           w: AppSize.s357.w
       ),
     ),
   ],
    );
  }

  Future<void>openLink(String link)async{
    var urlink=link;
    if(await canLaunch((urlink))){
      await launch (urlink);
    }
    else{
      await launch (urlink);
    }
  }

}
