
import 'package:doctor_plant/Fetutres/onBoardingView/data/onBoardingData.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CustomPageViewItem extends StatelessWidget {
   CustomPageViewItem( {Key? key,required this.onBoardingData}) : super(key: key);
  OnBoardingData onBoardingData;
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            onBoardingData.title,style:const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            onBoardingData.body,style:const TextStyle(
              color: Colors.white,
              fontSize: 21,
              wordSpacing: 1.5
          ),),
        ],
      ),
    );
  }
}
