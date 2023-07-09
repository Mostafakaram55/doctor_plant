
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_state.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/widgets/Cultivation%20_Tips.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/widgets/Take_%20picture_widget.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/widgets/uploading%20_Widget.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/funcations/custom_Button.dart';
import '../../../../core/resources/text_Manager.dart';
import '../viewModel/scan_cubit.dart';
class CustomScanWidget extends StatelessWidget {
  const CustomScanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCultivationTips(
      w: AppSize.s398.w,
      h: AppSize.s160.h,
      container:Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TakeAPicture(),
            defaultButton(
                w:AppSize.s290.w,
                h: AppSize.s30.h,
                color: ColorManager.buttonColor,
                borderRadius: BorderRadius.circular(AppSize.s14),
                textColor: ColorManager.primary,
                text: TextManager.takePicture,
                function:(){
                  showDialog(
                      context: context,
                      builder: (context)=>AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        title: Text(
                          TextManager.selectMethod,
                          style:GoogleFonts.montserrat(
                            color:Theme.of(context).disabledColor,
                          ),
                        ),
                        content:const  UploadingWidget(),
                      ));
                }
            ),
          ],
        ),
      ),
    );
  }
}
