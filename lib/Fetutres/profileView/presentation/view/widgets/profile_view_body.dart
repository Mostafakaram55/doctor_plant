
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_plant/Fetutres/RegisterView/data/models/user_create.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/view/edit_profile_view.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_state.dart';
import 'package:doctor_plant/core/funcations/custom_Button.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/shared_pref.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:doctor_plant/core/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/funcations/custom_form_fild.dart';
import '../../../../../core/widgets/list_of_shimmer.dart';
import '../../../../../core/widgets/profile_shimmer.dart';
class ProFileViewBody extends StatelessWidget {
   const ProFileViewBody({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state){
        SocialUserModel? model=ProfileCubit.get(context).userCreate;
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConditionalBuilder(
              condition:model!=null,
              builder: (context)=>Column(
                children: [
                  SizedBox(height: AppSize.s16.h,),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: AppSize.s16.sp),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            TextManager.profile,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.s24.sp,
                                color: Theme.of(context).disabledColor
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return const EditProfile();
                              }));
                            }, icon:Icon(
                          IconBroken.Edit_Square,
                          color: Theme.of(context).disabledColor,
                          size: AppSize.s30.sp,
                        )),
                        IconButton(
                            onPressed: (){
                              Shared.removeData(key: 'uId').then((value) {
                                  Navigator.popAndPushNamed(context, NameRout.loginRoute);
                              });
                            }, icon:Icon(
                          IconBroken.Arrow___Up_Square,
                          color: Theme.of(context).disabledColor,
                          size: AppSize.s30.sp,
                        )),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.sp,
                    color: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(height: AppSize.s20.h,),
                  Center(
                    child:CircleAvatar(
                      radius: AppSize.s82.sp,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: CircleAvatar(
                        radius: AppSize.s70.sp,
                        backgroundColor: Theme.of(context).primaryColor,
                        child:  CircleAvatar(
                          radius: AppSize.s60.sp,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s60.sp),
                                image:DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(ProfileCubit.get(context).userCreate!.image.toString()),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s20.h,),
                  Text(
                    ProfileCubit.get(context).userCreate!.name!,
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).disabledColor,
                      fontSize:AppSize.s20.sp ,
                      fontWeight:FontWeight.bold ,
                    ),
                  ),
                  SizedBox(height: AppSize.s8.h,),
                  Padding(
                    padding:  EdgeInsets.all(AppSize.s20.sp),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconBroken.Message,
                          color:ColorManager.buttonColor,
                        ),
                        hintText:ProfileCubit.get(context).userCreate!.email! ,
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
                  ),
                  SizedBox(height: AppSize.s8.h,),
                  Padding(
                    padding:EdgeInsets.all(AppSize.s20.sp),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconBroken.Profile,
                          color:ColorManager.buttonColor,
                        ),
                        hintText:ProfileCubit.get(context).userCreate!.name! ,
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
                  ),
                  SizedBox(height: AppSize.s8.h,),
                  Padding(
                    padding:  EdgeInsets.all(AppSize.s20.sp),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconBroken.Call,
                          color:ColorManager.buttonColor,
                        ),
                        hintText:ProfileCubit.get(context).userCreate!.phone! ,
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
                  ),
                ],
              ),
              fallback: (context)=> const ProfileShimmer(),
            ),
          ),
        );
      },
    );
  }
}
