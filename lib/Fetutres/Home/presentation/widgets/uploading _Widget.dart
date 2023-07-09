
import 'package:cherry_toast/cherry_toast.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/view/result_scree.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_cubit.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/resources/assetse_Manager.dart';
import '../../../../core/resources/route_Manager.dart';
import '../../../../core/resources/values_Manager.dart';
import '../view/result_scree.dart';
import 'custom_image_dailog.dart';

class UploadingWidget extends StatelessWidget {
  const UploadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ScanCubit,ScanState>(
      builder: (context,state){
        return  SizedBox(
          height: AppSize.s70.h,
          width: AppSize.s70.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageDialog(
                image: AssetsData.photo,
                function: (){
                  ScanCubit.get(context).uploadImage().then((value) {
                    Navigator.pushNamed(context, NameRout.resultView,
                        arguments: ResultVariables(
                            imagePath: ScanCubit.get(context).selectedImage!,
                            prediction: value['Prediction'],
                            confidence: value['confidence']));
                  });
                },
              ),
              SizedBox(
                width:AppSize.s30.w,
              ),
              CustomImageDialog(
                function: (){

                  CherryToast.info(
                    backgroundColor: Theme.of(context).primaryColor,
                    title:Text(
                        'Sorry, this feature is not currently enabled',
                      style: GoogleFonts.acme(
                        color: Theme.of(context).disabledColor,
                      )
                    ),
                    actionHandler: (){
                      print("Action button pressed");
                    },
                  ).show(context);
                  //event
                },
                image: AssetsData.camera,
              ),
            ],
          ),
        );
      },
    );
  }
}
