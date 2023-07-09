import 'package:dio/dio.dart';
import 'package:doctor_plant/Fetutres/Home/data/weather_model.dart';
import 'package:doctor_plant/core/const.dart';
import 'package:doctor_plant/core/resources/share_data.dart';

class WeatherCall{
  Dio? dio;
  WeatherCall(){
    BaseOptions baseOptions=BaseOptions(
      baseUrl: EndPoint.basUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio=Dio(baseOptions);
  }

   Future<Map<String,dynamic>>getWeather({
  required String endpoint,
     required Map<String,dynamic>parameters,
})async{
    Response response=await dio!.get(
      endpoint,queryParameters: parameters,
    );
    print(response.data);
    return response.data;
 }
}