
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_plant/Fetutres/RegisterView/presentation/viewModel/register_cubit.dart';
import 'package:doctor_plant/Fetutres/RegisterView/presentation/viewModel/register_state.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/funcations/custom_Button.dart';
import '../../../../core/funcations/custom_form_fild.dart';
import '../../../../core/resources/color_Manager.dart';
import '../../../../core/resources/share_data.dart';
class RegisterBody extends StatelessWidget {
   RegisterBody({Key? key}) : super(key: key);
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){
        if(state is CreateUserSuccess){
           Navigator.pushReplacementNamed(context, NameRout.homeRoute);
        }
      },
      builder: (context,state){
        return SafeArea(
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Padding(
                padding:EdgeInsets.all(AppSize.s12.sp),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:   [
                      SizedBox(height: AppSize.s60.sp,),
                      Center(
                        child: Text(
                            TextManager.register.toUpperCase(),
                            style:GoogleFonts.montserrat(
                              color: ColorManager.black,
                              fontSize: AppSize.s24.sp,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      defaultFormFiled(
                        type: TextInputType.text,
                        text: 'Full Name',
                        prefixIcon:  Icon(
                          IconBroken.Profile,
                          color: ColorManager.gray,
                        ),
                        controller: fullNameController,
                      ),
                      SizedBox(
                        height: AppSize.s30.h,
                      ),
                      defaultFormFiled(
                          type: TextInputType.emailAddress,
                          text: 'Email',
                          prefixIcon:  Icon(
                            IconBroken.Message,
                            color: ColorManager.gray,
                          ),
                          controller: usernameRegisterController
                      ),
                      SizedBox(
                        height: AppSize.s30.h,
                      ),
                      defaultFormFiled(
                        type: TextInputType.phone,
                        text: 'Phone',
                        prefixIcon:  Icon(
                          IconBroken.Call,
                          color: ColorManager.gray,
                        ),
                        controller: phoneController,
                      ),

                      SizedBox(
                        height: AppSize.s30.h,
                      ),
                      defaultFormFiled(
                        obscure: RegisterCubit.get(context).chick,
                        controller: passwordRegisterController,
                        text: 'Password',
                        type: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: (){
                            RegisterCubit.get(context).changIcon();
                          },
                          icon: RegisterCubit.get(context).chick?Icon(
                            Icons.visibility_off,
                            color: ColorManager.buttonColor,
                          ):Icon(
                            Icons.visibility,
                            color: ColorManager.buttonColor,
                          )
                        ),
                        prefixIcon: Icon(
                          IconBroken.Lock,
                          color: ColorManager.gray,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s30.h,
                      ),
                      defaultFormFiled(
                        obscure: RegisterCubit.get(context).chickConfirm,
                        controller: confirmPasswordRegisterController,
                        text: 'confirm Password',
                        type: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: (){
                            RegisterCubit.get(context).changConfirmIcon();
                          },
                          icon: RegisterCubit.get(context).chickConfirm?Icon(
                            Icons.visibility_off,
                            color: ColorManager.buttonColor,
                          ):Icon(
                            Icons.visibility,
                            color: ColorManager.buttonColor,
                          )
                        ),
                        prefixIcon:Icon(
                          IconBroken.Lock,
                          color: ColorManager.gray,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s30.h,
                      ),
                      ConditionalBuilder(
                        condition:state is! LoadingRegisterState,
                        builder: (context)=> defaultButton(
                          text: 'REGISTER',
                          color: ColorManager.buttonColor,
                          borderRadius: BorderRadius.circular(AppSize.s14.sp),
                          textColor: ColorManager.secondColor,
                          function: (){
                            if(formKey.currentState!.validate()){
                            RegisterCubit.get(context).userRegister(
                                userName: fullNameController.text,
                                email: usernameRegisterController.text,
                                phone: phoneController.text,
                                password: passwordRegisterController.text,
                                confirmPassword: confirmPasswordRegisterController.text
                            );
                            }
                          },
                          w:AppSize.s357.w,
                          h: AppSize.s53.h,
                        ),
                        fallback:(context)=>Center(child:CircularProgressIndicator(
                          color: ColorManager.buttonColor,
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text(TextManager.alreadyHaveAnAccount),
                          TextButton(
                              onPressed: (){
                                Navigator.popAndPushNamed(context,NameRout.loginRoute);
                              },
                              child:Text(
                                TextManager.logInWord,
                                style: TextStyle(
                                    color: ColorManager.buttonColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.s16.sp
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
