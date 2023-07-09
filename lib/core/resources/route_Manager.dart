import 'dart:io';

import 'package:doctor_plant/Fetutres/LogInView/presentation/view/logIn_view.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/view/edit_profile_view.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:doctor_plant/Fetutres/res_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Fetutres/Home/presentation/view/home_treat.dart';
import '../../Fetutres/Home/presentation/view/result_scree.dart';
import '../../Fetutres/Home/presentation/view/steps_agriculture.dart';
import '../../Fetutres/PostsView/presentation/view/posts_view.dart';
import '../../Fetutres/PostsView/presentation/viewModel/post_cubit.dart';
import '../../Fetutres/RegisterView/presentation/view/Register_view.dart';
import '../../Fetutres/RegisterView/presentation/view/Register_view_body.dart';
import '../../Fetutres/homeView/presentation/view/detailsView.dart';
import '../../Fetutres/homeView/presentation/view/homeView.dart';
import '../../Fetutres/settingsView/presentation/presentation/view/chat_pot/body_chat.dart';
import '../../Fetutres/splashView/presentation/view/splash_view.dart';

class NameRout {
  static const splashRoute = '/';
  static const homeRoute = '/homeView';
  static const detailsRoute = '/detailsView';
  static const loginRoute = '/loginView';
  static const profileRoute = '/profileView';
  static const registerRoute = '/Register';
  static const result = '/result';
  static const postsView = '/PostsView';
  static const homeTreat = '/HomeTreat';
  static const editProfile = '/editProfile';
  static const resultView = '/ResultView';
  static const chatHome = '/ChatHome';
  static const stepsPage = '/stepsPage';
}

class ResultVariables {
  final File imagePath;
  final String prediction;
  final double confidence;

  const ResultVariables(
      {required this.imagePath,
      required this.prediction,
      required this.confidence});
}

class RouteGenerator {
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case NameRout.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case NameRout.stepsPage:
        return MaterialPageRoute(builder: (_) => const  Steps());
      case NameRout.homeRoute:
        //final bookModel = settings.arguments as BookModel;
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create:(context)=>PostCubit()..getPosts()..getUserData(),),
            BlocProvider(create: (context)=>ProfileCubit()..getUserData()),
          ],
            child: const HomeView()));
      case NameRout.detailsRoute:
        //final bookModel = settings.arguments as BookModel;//السطر ده مكنتش فاهم بيعمل اي
        return MaterialPageRoute(builder: (_) => const DetailsView());
      case NameRout.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case NameRout.postsView:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create:(context)=>PostCubit()..getUserData()),
              BlocProvider(create: (context)=>ProfileCubit()..getUserData()),
            ],
            child: const PostsView()));
      case NameRout.homeTreat:
        return MaterialPageRoute(builder: (_) => const HomeTreat());
      case NameRout.loginRoute:
        return MaterialPageRoute(builder: (_) => const LogInView());
      case NameRout.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case NameRout.chatHome:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case NameRout.result:
        final data = settings.arguments as ResultVariables;
        return MaterialPageRoute(
            builder: (_) => Res(
                  confidence: data.confidence,
                  imagePath: data.imagePath,
                  prediction: data.prediction,
                ));
      case NameRout.resultView:
        final data = settings.arguments as ResultVariables;
        return MaterialPageRoute(
            builder: (_) => ResultView(
              confidence: data.confidence,
              imagePath: data.imagePath,
              prediction: data.prediction,
            ));
    }
    return noFoundRoute();
  }

  static Route<dynamic> noFoundRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('NO FOUND ROUT'),
              ),
            ));
  }
}
