
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:flutter/material.dart';

class CustomCultivationTips extends StatelessWidget {
  const CustomCultivationTips({Key? key, required this.w, required this.h,required this.container}) : super(key: key);
  final double w;
  final double h;
  final Container container;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      color:ColorManager.secondColor,
      child:container,
    );
  }
}
