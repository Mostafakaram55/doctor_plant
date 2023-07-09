
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/color_Manager.dart';
import '../../../../core/resources/icons.dart';

class Descrabtion extends StatelessWidget {
   const Descrabtion({Key? key, required this.title, required this.text,required this.image}) : super(key: key);
final String title;
final String text;
final String  image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
        title: Text(
          title,
          style: GoogleFonts.acme(
              color: ColorManager.buttonColor,
            fontWeight: FontWeight.bold,
            fontSize: FontSize.s20.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(AppSize.s10.sp),
            child: Column(
              children: [
              Image.asset(
                  image,
                width: 200.w,
                height: 200.h,
              ),
              Text(
                text,
                  textDirection:text.startsWith(RegExp(r'[a-zA-Z]',caseSensitive: false))
                      ?TextDirection.ltr:
                  TextDirection.rtl,
                maxLines: 40,
                  style:TextStyle(
                    color: Theme.of(context).disabledColor,
                    fontSize: FontSize.s20.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.6
                  )
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
