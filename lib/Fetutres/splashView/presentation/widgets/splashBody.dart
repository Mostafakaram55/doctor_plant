
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/resources/route_Manager.dart';
import '../../../../core/resources/shared_pref.dart';
import '../../../../core/resources/values_Manager.dart';
class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);
  
  @override
  
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children:[
        Image.asset(
            AssetsData.splashImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:AppSize.s75.sp),
          child:  Text(
              TextManager.plantDoctor,
            style: GoogleFonts.actor(
              color:Colors.white,
              fontSize: AppSize.s40.sp
            ),

          ),
        ),
        Center(
          child: SizedBox(
            height: 200.h,
            child: Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_xd9ypluc.json',
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:AppSize.s60.sp),
          child: const Align(
            alignment:  AlignmentDirectional.bottomCenter,
              child:  CircularProgressIndicator(
                color: Colors.white,
              )),
        ),
      ],
    );
  }
  void nextPage(){
    Future.delayed(const Duration(seconds: 4),(){
      if(Shared.getDate(key:'uId')!=null){
        Navigator.pushReplacementNamed(context, NameRout.homeRoute);
      }else{
        Navigator.pushReplacementNamed(context, NameRout.loginRoute);
      }
    });
  }
}

