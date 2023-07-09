
import 'dart:io';

import 'package:doctor_plant/Fetutres/Home/presentation/view/result_screen_body.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultView extends StatelessWidget {
  const ResultView(
      {Key? key,
        required this.imagePath,
        required this.prediction,
        required this.confidence})
      : super(key: key);

  final File imagePath;
  final String prediction;

  final double confidence;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  ResultViewBody(
        imagePath:imagePath ,
        prediction: prediction,
        confidence: confidence,
      ),
    );
  }
}
