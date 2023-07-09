
import 'package:doctor_plant/Fetutres/Home/presentation/view/steps_agriculture.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/weather_cubit.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/widgets/custom_appbar.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/widgets/scan_widget.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';

import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/funcations/get_location.dart';
import '../widgets/weather_widget.dart';
class HomeTreatBody extends StatefulWidget {
  const HomeTreatBody({Key? key}) : super(key: key);

  @override
  State<HomeTreatBody> createState() => _HomeTreatBodyState();
}

class _HomeTreatBodyState extends State<HomeTreatBody> {
  @override
  void initState() {
    LocationService locationService=LocationService();
    locationService.getCurrentLocation().then((value) {
      WeatherCubit.get(context).getWeather(lat: value.latitude.toString(),long: value.longitude.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.sp,horizontal: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 7.h,),
            Padding(
              padding:  EdgeInsets.all(8.0.sp),
              child: const CustomAppBar(),
            ),
            Card(
              elevation: 0,
              child: Container(
                  width:AppSize.s428,
                  height: AppSize.s133.h,
                  color: Theme.of(context).backgroundColor,
                  child:Padding(
                    padding:  EdgeInsets.all(AppSize.s8.sp),
                    child: Row(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> const Steps()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s8.sp),
                              color:Theme.of(context).primaryColor,
                            ),
                            width: AppSize.s120.w,
                            height: AppSize.s90.h,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:10),
                              child: Column(
                                children: [
                                  Image(
                                      width: AppSize.s24.w,
                                      height: AppSize.s22.h,
                                      image: const AssetImage(
                                        AssetsData.leaf,
                                      )),
                                  Text(
                                    TextManager.cultivationTips,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        color: Theme.of(context).disabledColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSize.s18.sp
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: AppSize.s100.w,
                          height:  AppSize.s100.h,
                          child: Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_zUShxQMjqI.json',
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
            SizedBox(
              height: AppSize.s8.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.sp),
              child: Text(
                TextManager.Healyourcrop,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              height: AppSize.s8.h,
            ),
            const  Card(
              elevation: 0,
                child:  CustomScanWidget()),
            SizedBox(
              height: AppSize.s8.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.sp),
              child: Text(
                TextManager.weather,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              height: AppSize.s8.h,
            ),
             Card(
              color: Theme.of(context).primaryColor,
              elevation: 0,
                child:const  WeatherWidget()),
          ],
        ),
      ),
    );
  }
}
