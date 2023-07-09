
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/values_Manager.dart';
class CustomImageDialog extends StatelessWidget {
  const CustomImageDialog({Key? key,required this.image,required this.function}) : super(key: key);
  final String image;
  final dynamic function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Image(
          width: AppSize.s50.w,
          height: AppSize.s50.h,
          image:AssetImage(image)
      ),
    );
  }
}
