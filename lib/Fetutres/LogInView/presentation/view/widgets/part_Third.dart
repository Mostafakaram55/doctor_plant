
import 'package:doctor_plant/Fetutres/LogInView/presentation/view/widgets/custom_Button_social.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assetse_Manager.dart';
import '../../../../../core/resources/color_Manager.dart';
import '../../../../../core/resources/text_Manager.dart';
import '../../../../../core/resources/values_Manager.dart';

class PartThird extends StatelessWidget {
  const PartThird({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s12.sp,),
        CustomButtonSocial(
          assetImage: AssetsData.googleLogo,
          radius: AppSize.s6.sp,
          textOption: TextManager.loginWthGoogle,
        ),
        SizedBox(height: AppSize.s12.sp,),
        CustomButtonSocial(
          assetImage: AssetsData.Facebooklogo,
          radius: AppSize.s6.sp,
          textOption:TextManager.loginWithFacebook,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(TextManager.DonthaveAnAccount),
            TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context,NameRout.registerRoute);
              },
              child: Text(
              TextManager.register,
              style: TextStyle(
                  color:ColorManager.buttonColor,
                fontSize: AppSize.s16.sp,
              ),
            ),
            )
          ],
        ),
      ],
    );
  }
}
