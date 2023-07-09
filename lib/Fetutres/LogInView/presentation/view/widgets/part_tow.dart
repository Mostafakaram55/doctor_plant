
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/funcations/custom_Button.dart';
import '../../../../../core/resources/color_Manager.dart';
import '../../../../../core/resources/text_Manager.dart';
import '../../../../../core/resources/values_Manager.dart';

class PartTow extends StatelessWidget {
  const PartTow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppPadding.p22.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Expanded(
                child: Row(children: [
                  Checkbox(
                    splashRadius: 10.sp,
                    hoverColor: ColorManager.primary,
                    checkColor: ColorManager.buttonColor,
                    activeColor: ColorManager.secondColor,
                    focusColor: ColorManager.primary,
                    fillColor: MaterialStateProperty.all(ColorManager.secondColor),
                    value: false,
                    onChanged:(value){},
                  ),
                  Text(
                    TextManager.rememberMe
                    ,style: TextStyle(
                      color: ColorManager.black
                  ),
                  ),
                ],),
              ),
              Expanded(
                child: TextButton(
                  onPressed: (){}, child: Text(
                  TextManager.forgotPassword,
                  style: TextStyle(
                      color:ColorManager.buttonColor,
                    fontSize: AppSize.s16.sp
                  ),
                ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: AppSize.s8.sp,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
          child: defaultButton(
            textColor: ColorManager.primary,
              color: ColorManager.buttonColor,
              text: TextManager.logInWord,
              w:357.w,
              h: 53.h,
              borderRadius:BorderRadius.circular(AppSize.s14.sp),
              function: (){

              }
          ),
        ),
        SizedBox(height: AppSize.s12.sp,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:AppPadding.p55.sp),
          child: Row(
            children: [
              SizedBox(
                width: AppSize.s100.w,
                child: Divider(
                  color: ColorManager.buttonColor,
                  height: AppSize.s40.h,
                  thickness: 1,
                ),
              ),
              const Spacer(),
              const Text(
                  TextManager.oR
              ),
              const  Spacer(),
              SizedBox(
                width: AppSize.s100.w,
                child: Divider(
                  color: ColorManager.buttonColor,
                  height: AppSize.s40.h,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
