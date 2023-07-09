


import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_plant/Fetutres/LogInView/presentation/view/widgets/custom_Button_social.dart';
import 'package:doctor_plant/Fetutres/LogInView/presentation/viewModel/login_cubit.dart';
import 'package:doctor_plant/Fetutres/LogInView/presentation/viewModel/login_state.dart';
import 'package:doctor_plant/core/funcations/custom_Button.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/funcations/custom_form_fild.dart';
import '../../../../../core/resources/color_Manager.dart';
import '../../../../../core/resources/icons.dart';
import '../../../../../core/resources/share_data.dart';
import '../../../../../core/resources/shared_pref.dart';
import '../../../../../core/resources/text_Manager.dart';
class LogInViewBody extends StatelessWidget {
    LogInViewBody({Key? key}) : super(key: key);
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){
        if(state is ErrorLoginState){
          CherryToast.error(
            title: Text(
                state.errorMessage,
              style: const TextStyle(
                color: Colors.pink
              ),
            ),
            enableIconAnimation:false,
            displayTitle: true,
            //description: const Text('Invalid account information'),
            animationType: AnimationType.fromRight,
            animationDuration: const Duration(milliseconds: 1000),
            autoDismiss: true,
            toastDuration: const Duration(seconds: 3),
          ).show(context);
        }else if(state is SuccessLoginState)
        {
          Shared.saveData(
              key: 'uId',
              value: state.uId,
          ).then((value) {
            Navigator.pushReplacementNamed(context,NameRout.homeRoute);
            CherryToast.success(
              displayIcon: true,
              title:Text(
                'Login Success',
                style:TextStyle(
                  color: ColorManager.buttonColor,
                ),
              ),
              enableIconAnimation:false,
              displayTitle: true,
              //description: const Text('Invalid account information'),
              animationType: AnimationType.fromRight,
              animationDuration: const Duration(milliseconds: 1000),
              autoDismiss: true,
              toastDuration: const Duration(seconds: 3),
            ).show(context);
          });
        }
      },
      builder: (context,state){
        return SafeArea(
          child: SingleChildScrollView(
            physics:const  BouncingScrollPhysics(),
            child: Form(
              key:formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s75.sp,),
                  Text(
                    TextManager.logInWord,
                    style: GoogleFonts.montserrat(
                        fontSize: AppSize.s30.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black
                    ),
                  ),
                  SizedBox(height: AppSize.s40.sp,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:AppPadding.p30),
                    child:defaultFormFiled(
                      submitted:( String value){
                        print(value);
                      },
                      text: 'Email',
                      controller: usernameController,
                      type: TextInputType.emailAddress,
                      prefixIcon:Icon(
                        IconBroken.Message,
                        color: ColorManager.gray,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s30.sp,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:AppPadding.p30),
                    child: defaultFormFiled(
                        submitted: ( String value){
                          print(value);
                        },
                        obscure: LoginCubit.get(context).chick,
                        text: 'Password',
                        type: TextInputType.visiblePassword,
                        controller: passwordController,
                        prefixIcon:  Icon(
                          IconBroken.Lock,
                          color: ColorManager.gray,
                        ),
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: (){
                            LoginCubit.get(context).changIcon();
                          },
                          icon: LoginCubit.get(context).chick?Icon(
                            Icons.visibility_off,
                            color: ColorManager.buttonColor,
                          ):Icon(Icons.visibility, color: ColorManager.buttonColor,),
                        )
                    ),
                  ),
                  SizedBox(height: AppSize.s8.sp,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: AppPadding.p22.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Expanded(
                          child: Row(children: [
                            Checkbox(
                              splashRadius: 10.sp,
                              hoverColor: ColorManager.primary,
                              checkColor: ColorManager.buttonColor,
                              activeColor: ColorManager.secondColor,
                              focusColor: ColorManager.primary,
                              fillColor: MaterialStateProperty.all(ColorManager.secondColor),
                              value: false,
                              onChanged:(value){},
                            ),
                            Text(
                              TextManager.rememberMe
                              ,style: TextStyle(
                                color: ColorManager.black
                            ),
                            ),
                          ],),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: (){}, child: Text(
                            TextManager.forgotPassword,
                            style: TextStyle(
                                color:ColorManager.buttonColor,
                                fontSize: AppSize.s16.sp
                            ),
                          ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s8.sp,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                    child: ConditionalBuilder(
                      condition: state is !LoadingLoginState,
                      builder: (context)=>defaultButton(
                        textColor: ColorManager.primary,
                        color: ColorManager.buttonColor,
                        text: TextManager.logInWord,
                        w:357.w,
                        h: 53.h,
                        borderRadius:BorderRadius.circular(AppSize.s14.sp),
                        function: (){
                          if(formKey.currentState!.validate()){
                            LoginCubit.get(context).userLogin(
                              email: usernameController.text,
                              password: passwordController.text,
                            );
                          }
                        }
                    ),
                      fallback: (context)=>const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  SizedBox(height: AppSize.s12.sp,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:AppPadding.p55.sp),
                    child: Row(
                      children: [
                        SizedBox(
                          width: AppSize.s100.w,
                          child: Divider(
                            color: ColorManager.buttonColor,
                            height: AppSize.s40.h,
                            thickness: 1,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                            TextManager.oR
                        ),
                        const  Spacer(),
                        SizedBox(
                          width: AppSize.s100.w,
                          child: Divider(
                            color: ColorManager.buttonColor,
                            height: AppSize.s40.h,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
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
              ),
            ),
          ),
        );
      },
    );
  }
}



