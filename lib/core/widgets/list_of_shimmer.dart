
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_cubit.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_state.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:doctor_plant/core/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOFShimmer extends StatelessWidget {
  const ListOFShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index)=> ShimmerContainerEffect(
          width:AppSize.s398.w,
          height:AppSize.s186.h,
          borderRadius: 10.sp,
        ),
        separatorBuilder: (context,index)=> SizedBox(height: AppSize.s10.h),
        itemCount:10,
    );
  }
}
