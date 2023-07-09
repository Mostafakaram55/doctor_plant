import 'package:doctor_plant/Fetutres/Home/data/weather_api.dart';
import 'package:doctor_plant/Fetutres/Home/data/weather_model.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/weather_state.dart';
import 'package:doctor_plant/core/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherCall):super (WeatherInitialState());
  static WeatherCubit get(BuildContext context)=>BlocProvider.of(context);
  WeatherModel? weatherModel;
  final WeatherCall weatherCall;
  void getWeather({
   required String lat,
   required String long,
}){
    emit(WeatherLoadingState());
    weatherCall.getWeather(
        endpoint: EndPoint.forecast,parameters:{
        'q':'$lat,$long',
        'Key':EndPoint.key,
        'days':3,
      }).then((value){
        weatherModel=WeatherModel.fromJson(value);
        emit(WeatherSuccessState());
        print('**********************************');
        print(weatherModel?.current!.tempC);
        print('**********************************');
      }).catchError((error){
        emit(WeatherErrorState(error.toString()));
      });
  }
}