
import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_cubit.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_state.dart';
import 'package:doctor_plant/core/funcations/custom_form_fild.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager_dark.dart';
import 'package:doctor_plant/core/resources/font_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/share_data.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/profile_shimmer.dart';
import '../../../../RegisterView/data/models/user_create.dart';

class EditProfileBody extends StatelessWidget {
   const EditProfileBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create:(context)=>ProfileCubit()..getUserData(),
      child: BlocConsumer<ProfileCubit,ProfileState>(
        listener: (context,state){},
        builder: (context,state){
          SocialUserModel? model=ProfileCubit.get(context).userCreate;
          var image=ProfileCubit.get(context).image;
          return  SingleChildScrollView(
            child: ConditionalBuilder(
              condition: model!=null,
              builder: (context)=>Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppSize.s10.sp,vertical: AppSize.s30.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.of(context).pop();
                                ProfileCubit.get(context).getUserData();
                              },icon:  Icon(
                                IconBroken.Arrow___Left_2,
                                color: Theme.of(context).disabledColor,
                                size: AppSize.s30.sp,
                              )),
                              Text(
                                'Edit Profile',
                                style: GoogleFonts.montserrat(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: AppSize.s20.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              ProfileCubit.get(context).updateUserData(
                                name: fullNameEditController.text,
                                phone: phoneEditController.text,
                                //image: ProfileCubit.get(context)._imageFiles,
                              );
                            }, child: Text(
                          'UpLoad',
                          style: GoogleFonts.
                          play(
                              fontSize: FontSize.s20.sp,
                              color: Theme.of(context).cardColor
                          ),
                        )),
                      ],
                    ),
                    Divider(
                      thickness: 1.sp,
                      color: Theme.of(context).backgroundColor,
                    ),
                    if(state is LoadingEditProfileState)
                      LinearProgressIndicator(
                        backgroundColor:Theme.of(context).backgroundColor,
                        color:  ColorManager.buttonColor,
                      ),
                    Center(
                      child:Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          CircleAvatar(
                            radius: AppSize.s82.sp,
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: CircleAvatar(
                              radius: AppSize.s70.sp,
                              backgroundColor: Theme.of(context).primaryColor,
                              child:CircleAvatar(
                                radius: AppSize.s60.sp,
                                backgroundImage:image==null?NetworkImage(ProfileCubit.get(context).userCreate!.image.toString()):FileImage(image)as ImageProvider,
                              ),
                            ),
                          ),
                          IconButton(
                              splashColor: Colors.transparent,
                              onPressed: (){
                                ProfileCubit.get(context).uploadImage();
                              }, icon: CircleAvatar(
                            backgroundColor: ColorManager.buttonColor,
                            radius: AppSize.s30.sp,
                            child: Icon(
                              IconBroken.Camera,
                              color: ColorManager.primary,
                              size: AppSize.s20.sp,
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    TextFormField(
                      controller: fullNameEditController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Theme.of(context).cardColor
                            )
                        ),
                        prefixIcon: Icon(
                          IconBroken.User,
                          color:ColorManager.buttonColor,
                        ),
                        hintText:ProfileCubit.get(context).userCreate!.name ,
                        hintStyle: TextStyle(
                          color: ColorManager.lightGrayOver,
                          fontSize: AppSize.s18.sp,
                        ),
                        hoverColor:ColorManager.primary,
                        fillColor: Theme.of(context).backgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSize.s10.sp),
                            borderSide: BorderSide(
                                color: ColorManager.primary
                            ),

                        ),

                      ),
                    ),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    TextFormField(
                      controller: phoneEditController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Theme.of(context).cardColor
                            )
                        ),
                        prefixIcon: Icon(
                          IconBroken.Call,
                          color:ColorManager.buttonColor,
                        ),
                        hintText:ProfileCubit.get(context).userCreate!.phone ,
                        hintStyle: TextStyle(
                          color: ColorManager.lightGrayOver,
                          fontSize: AppSize.s18.sp,
                        ),
                        hoverColor:ColorManager.primary,
                        fillColor: Theme.of(context).backgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSize.s10.sp),
                            borderSide: BorderSide(
                                color: ColorManager.primary
                            )
                        ),

                      ),
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                  ],
                ),
              ),
              fallback:(context)=>const ProfileShimmer() ,
            ),
          );
        },
      ),
    );
  }
}
