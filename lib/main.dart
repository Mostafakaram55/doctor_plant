
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_cubit.dart';

import 'package:doctor_plant/Fetutres/LogInView/presentation/viewModel/login_cubit.dart';

import 'package:doctor_plant/Fetutres/RegisterView/presentation/viewModel/register_cubit.dart';

import 'package:doctor_plant/Fetutres/homeView/presentation/viewModel/bottom_Cubit.dart';

import 'package:doctor_plant/core/resources/Theme/Theme_data/theme_data_dark.dart';
import 'package:doctor_plant/core/resources/change_states.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/shared_pref.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Fetutres/Home/data/weather_api.dart';
import 'Fetutres/Home/presentation/viewModel/weather_cubit.dart';
import 'core/resources/Theme/Theme_data/theme_data_light.dart';
import 'core/resources/chang_theme_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Shared.init();
  bool isDark = Shared.getBoolData(key: 'isDark')!;
  runApp(MyApp(isDark: isDark,));
}
class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({super.key, required this.isDark});
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
        builder: (BuildContext context, Widget? child){
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => BottomParCubit()),
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => RegisterCubit()),
              BlocProvider(create: (context) => ScanCubit()),
              BlocProvider(create: (context) => ChangeAppMode()..changeMode(fromShared: isDark)),
              BlocProvider(
                  create: (BuildContext context) =>
                      WeatherCubit(WeatherCall())),
            ],
            child: BlocBuilder<ChangeAppMode,ChangeStates>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: RouteGenerator.getRout,
                  theme: ChangeAppMode.get(context).isDark
                      ? getThemeDataDark()
                      : getThemeDataLight(),
                );
              },
            ));
      },
    );
  }
}
