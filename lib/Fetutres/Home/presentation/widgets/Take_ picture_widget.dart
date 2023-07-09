
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TakeAPicture extends StatelessWidget {
  const TakeAPicture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppSize.s12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children:  [
              const Image(image:AssetImage(AssetsData.Group1)),
               SizedBox(
                height: 3.h,
              ),
              Text(
                  'Tack a picture',
                  style:Theme.of(context).textTheme.labelMedium
              )
            ],
          ),
          const Spacer(),
          Column(
            children:  [
              const Image(image:AssetImage(AssetsData.Group2)),
               SizedBox(
                height: 3.h,
              ),
              Text(
                'See diagnosis',
                  style:Theme.of(context).textTheme.labelMedium
              )
            ],
          ),
          const Spacer(),
          Column(
            children:  [
              const Image(image:AssetImage(AssetsData.medicine)),
              Text(
                'Get medicine',
                style:Theme.of(context).textTheme.labelMedium
              )
            ],
          ),
        ],
      ),
    );
  }
}
