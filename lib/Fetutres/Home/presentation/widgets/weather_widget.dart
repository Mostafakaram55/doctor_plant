
import 'package:doctor_plant/Fetutres/Home/data/weather_model.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/weather_cubit.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/weather_state.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:doctor_plant/core/widgets/shimmer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/resources/text_Manager.dart';
import 'Cultivation _Tips.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherState>(
      builder: (context,state){
         WeatherModel? weatherModel=WeatherCubit.get(context).weatherModel;
        if(state is WeatherSuccessState){
          return  CustomCultivationTips(
            w:AppSize.s398.w,
            h:150.h,
            container: Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding:  EdgeInsets.all(AppSize.s12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      '${weatherModel!.location!.name}, ${weatherModel.forecast!.forecastday![0].date}',
                      style:Theme.of(context).textTheme.titleSmall ,
                    ),
                    Row(
                      children:  [
                        Text(
                          '${weatherModel.current!.tempC}°C',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const Spacer(),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context)=>AlertDialog(
                                    backgroundColor: Theme.of(context).backgroundColor,
                                    title: Text(
                                      'Weather degrees',
                                      style:GoogleFonts.montserrat(
                                        color:Theme.of(context).disabledColor,
                                      ),
                                    ),
                                    content:SizedBox(
                                      height: AppSize.s100.h,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${weatherModel.forecast!.forecastday![0].date}',
                                                style: GoogleFonts.abel(
                                                  fontSize: FontSize.s15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).disabledColor,
                                                ),
                                              ),
                                              Center(
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.yellow,
                                                  radius: AppSize.s16.sp,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                    '${weatherModel.forecast!.forecastday![0].day!.avgtempC}°C',
                                                  style: GoogleFonts.abel(
                                                    fontSize: FontSize.s18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context).disabledColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${weatherModel.forecast!.forecastday![1].date}',
                                                style: GoogleFonts.abel(
                                                  fontSize: FontSize.s15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).disabledColor,
                                                ),
                                              ),
                                              Center(
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.yellow,
                                                  radius: AppSize.s16.sp,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                    '${weatherModel.forecast!.forecastday![1].day!.avgtempC}°C',
                                                  style: GoogleFonts.abel(
                                                    fontSize: FontSize.s18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context).disabledColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${weatherModel.forecast!.forecastday![2].date}',
                                                style: GoogleFonts.abel(
                                                  fontSize: FontSize.s15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).disabledColor,
                                                ),
                                              ),
                                              Center(
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.yellow,
                                                  radius: AppSize.s16.sp,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                    '${weatherModel.forecast!.forecastday![2].day!.avgtempC}°C',
                                                  style: GoogleFonts.abel(
                                                    fontSize: FontSize.s18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context).disabledColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  )
                              );
                            }, icon: Icon(
                          IconBroken.Category,
                          size: AppSize.s30.sp,
                          color: Theme.of(context).disabledColor,
                        )),
                         SizedBox(
                          height: 60.h,
                          child: Lottie.network(
                            'https://assets3.lottiefiles.com/packages/lf20_kljxfos1.json',
                          ),
                         ),
                      ],
                    ),
                    Text(
                      '${weatherModel.current!.condition!.text}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Divider(
                      height: 1.h,
                      thickness: 1.sp,
                      color: ColorManager.gray,
                    ),
                    Text(
                      'Rain in the morning, cloudy in the afternoon. Today would be a bad day for: Applying Pesticides',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.s13.sp,
                        color:Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }else {
          return ShimmerContainerEffect(
            width:AppSize.s398.w,
            height:150.h,
            borderRadius: 10.sp,
          );
        }
      },
    );
  }
}
