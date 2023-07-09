
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_plant/Fetutres/PostsView/data/post_model.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_cubit.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_state.dart';
import 'package:doctor_plant/Fetutres/SocialView/presentation/Widgets/custom_list_item.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:doctor_plant/core/widgets/list_of_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/assetse_Manager.dart';
import '../Widgets/ccount_rating_widget.dart';
import '../Widgets/comment_item.dart';
class SocialViewBody extends StatelessWidget {
   const SocialViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit,PostState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=PostCubit.get(context);
        List<PostModel> list=cubit.userPostsData;
        if(list.isEmpty){
          return  Padding(
            padding:  EdgeInsets.all(AppSize.s16.sp),
            child: const ListOFShimmer(),
          );
        }
        return ListView.separated(
            itemBuilder: (context,index)=>customListPosts(PostCubit.get(context).userPostsData[index],context),
            separatorBuilder: (context,index)=>SizedBox(height: 10.h,), itemCount: PostCubit.get(context).userPostsData.length);
      },
    );
  }
  Widget customListPosts(PostModel model,context)=>Column(
    children: [
      SizedBox(height: AppSize.s10.h,),
      Card(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.all(AppSize.s8.sp),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: Padding(
          padding:EdgeInsets.all(AppSize.s12.sp),
          child: Column(
            crossAxisAlignment: model.text!.startsWith(RegExp(r'[a-zA-Z]'))?CrossAxisAlignment.start: CrossAxisAlignment.end,
            children:  [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s24.sp,
                    backgroundImage:model.image!=null?NetworkImage('${model.image}'):NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtwN6DvgZJj9kAZY2vc9UB4obNWqF_X1KJZQQGvULI&s'),
                  ),
                  SizedBox(width: AppSize.s14.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          '${model.name}',
                          style: TextStyle(
                            height: 1.3.h,
                            color: ColorManager.buttonColor,
                            fontSize: AppSize.s16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${model.dataTime}',
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
                  SizedBox(width: AppSize.s14.w,),
                  IconButton(
                      iconSize: AppSize.s22.sp,
                      onPressed: (){}, icon:Icon(
                    IconBroken.More_Square,
                    color: Theme.of(context).disabledColor,
                  ))
                ],
              ),
              Divider(
                height:AppSize.s18.h,
                thickness: 1,
              ),
              SizedBox(height: AppSize.s8.h,),
              Text(
                textDirection:model.text!.startsWith(RegExp(r'[a-zA-Z]',caseSensitive: false))
                    ?TextDirection.ltr:
                TextDirection.rtl,
                  '${model.text}',
                   maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: AppSize.s16.sp,
                  height: 1.h,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              if(model.postImage!='')
              Padding(
                padding:  EdgeInsets.symmetric(vertical: AppSize.s16.sp),
                child: Container(
                  height: AppSize.s150.h,
                  width: double.infinity.w,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s8.sp),
                    image: DecorationImage(
                        image:NetworkImage('${model.postImage}'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s4.sp),
                child: Row(
                  children: [
                    CountWidget(
                      mainAxisAlignment: MainAxisAlignment.start,
                      icon: IconBroken.Heart,
                      function: (){},
                      count: '0',
                    ),
                    CountWidget(
                      mainAxisAlignment: MainAxisAlignment.center,
                      icon: IconBroken.Send,
                      function: (){},
                      count: '0',
                    ),
                    CountWidget(
                      mainAxisAlignment: MainAxisAlignment.end,
                      icon: IconBroken.Chat,
                      function: (){},
                      count: '0',
                    ),
                  ],
                ),
              ),
              Divider(
                height:AppSize.s18.h,
                thickness: 1,
              ),
              const CommentItem(),
            ],
          ),
        ),
      ),
    ],
  );
}
