
import 'package:doctor_plant/Fetutres/LogInView/presentation/view/widgets/LogIn_view_body.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:flutter/material.dart';
class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorManager.primary,
      body: LogInViewBody(),
    );
  }
}
