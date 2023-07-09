
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child:Row(
            children: [
              Text(
                'Plant Doctor',
                style:Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(width: AppSize.s8.w,),
              Image(
                  width: AppSize.s20.w,
                  height: AppSize.s20.h,
                  image:const  AssetImage(
                    AssetsData.logoPlant,
                  )
              )
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_mkkyx8ft.json',
          ),
        ),
      ],
    );
  }
}
