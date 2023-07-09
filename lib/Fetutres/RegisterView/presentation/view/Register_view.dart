
import 'package:doctor_plant/Fetutres/RegisterView/presentation/view/Register_view_body.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      body:  RegisterBody(),
    );
  }
}
