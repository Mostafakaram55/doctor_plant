
import 'dart:io';

import 'package:doctor_plant/Fetutres/PostsView/data/post_model.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_cubit.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_state.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_cubit.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_state.dart';
import 'package:doctor_plant/core/funcations/custom_Button.dart';
import 'package:doctor_plant/core/funcations/custom_form_fild.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:doctor_plant/core/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/assetse_Manager.dart';
import '../../../../core/resources/share_data.dart';
import '../../../../core/resources/text_Manager.dart';
class PostsViewBody extends StatelessWidget {
   PostsViewBody({Key? key}) : super(key: key);
  var formPostKey = GlobalKey<FormState>();
   //PostModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit,PostState>(
      listener: (context,state){},
      builder: (context,state){
        PostModel? model;
        return  Padding(
          padding:  EdgeInsets.all(AppSize.s20.sp),
          child: Column(
            children: [
              SizedBox(height: AppSize.s10.h,),
              if (state is CratePostLoading)
                 LinearProgressIndicator(
                  backgroundColor:Theme.of(context).backgroundColor,
                  color:  ColorManager.buttonColor,
                ),
              if(state is CratePostSuccess)
              const SafeArea(child:SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(onPressed:(){
                          Navigator.pop(context);//متنساش تغيرها
                        },icon:Icon(
                              IconBroken.Arrow___Left,
                              color:ColorManager.buttonColor,
                              size: AppSize.s30.sp,
                            )),
                        SizedBox(
                          width: AppSize.s8.w,
                        ),
                        Text(
                          TextManager.createPost,
                          style: GoogleFonts.montserrat(
                              fontSize:AppSize.s22.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).disabledColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(onPressed: (){
                    final now = DateTime.now();
                    if(
                    formPostKey.currentState!.validate()){
                      if(PostCubit.get(context).image==null){
                        print(textPostController.text);
                        PostCubit.get(context).createPost(
                          dataTime:now.toString(),
                          text: textPostController.text,
                        ).then((value) {
                          Navigator.pop(context);
                          PostCubit.get(context).getPosts();
                        });
                      }
                      else{
                        print(textPostController.text);
                        PostCubit.get(context).uploadPostImage(
                          dataTime:now.toString(),
                          text: textPostController.text,
                        );
                      }
                    }
                  }, child: Text(
                    'Post',
                    style: GoogleFonts.montserrat(
                        fontSize: AppSize.s20.sp,
                        color: ColorManager.descriptionColor
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              Row(
                children: [
                  ProfileCubit.get(context).userCreate!=null? CircleAvatar(
                 radius: AppSize.s24.sp,
                     backgroundImage:ProfileCubit.get(context).userCreate!.image!=null?NetworkImage(ProfileCubit.get(context).userCreate!.image!):const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtwN6DvgZJj9kAZY2vc9UB4obNWqF_X1KJZQQGvULI&s'),
                    ): Shimmer.fromColors(
                      baseColor: Theme.of(context).backgroundColor.withOpacity(0.9),
                              highlightColor:Theme.of(context).primaryColor,
                       child: CircleAvatar(
                         radius: AppSize.s16.sp,
                         ),
                       ),
                  SizedBox(width: AppSize.s14.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        if (ProfileCubit.get(context).userCreate!=null) Text(
                          ProfileCubit.get(context).userCreate!.name,
                          style: TextStyle(
                            height: 1.3.h,
                            color: ColorManager.buttonColor,
                            fontSize: AppSize.s16,
                            fontWeight: FontWeight.w500,
                          ),
                        ) else ShimmerContainerEffect(width: 100.w, height: 30.h, borderRadius: 7),
                        Text(
                          'Public',
                          style: TextStyle(
                              height: 1.3.h,
                              fontSize: AppSize.s12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.descriptionColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s30.h,
              ),
              Expanded(
                child: Form(
                  key:formPostKey ,
                  child: TextFormField(
                    controller: textPostController,
                    decoration:  InputDecoration(
                        hintText: 'What is one your mind...',
                        hintStyle: GoogleFonts.montserrat(
                          color: ColorManager.descriptionColor,
                          fontSize: AppSize.s18.sp,
                        ),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
             if(PostCubit.get(context).image!=null)
               Stack(
                 alignment: AlignmentDirectional.topEnd,
                 children: [
                   Container(
                     height: AppSize.s150.h,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(AppSize.s4.sp),
                         topRight: Radius.circular(AppSize.s4.sp),
                       ),
                       image: DecorationImage(
                         fit: BoxFit.fill,
                         image:FileImage(PostCubit.get(context).image!),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: CircleAvatar(
                       radius: AppSize.s24.sp,
                       backgroundColor: ColorManager.buttonColor,
                       child: IconButton(
                           onPressed: (){
                             PostCubit.get(context).removePostImage();
                           }, icon: Icon(
                         IconBroken.Close_Square,
                         size: AppSize.s28.sp,
                         color: Theme.of(context).disabledColor,
                       )),
                     ),
                   )
                 ],
               ),
              SizedBox(
                height: AppSize.s16.h,
              ),
              defaultButton(
                color: ColorManager.buttonColor,
                text: TextManager.addImage,
                textColor: ColorManager.primary,
                function: (){
                  PostCubit.get(context).postImage();
                  PostCubit.get(context).getPosts();
                },
                borderRadius: BorderRadius.circular(AppSize.s12.sp),
              ),
            ],
          ),
        );
      },
    );
  }
}
