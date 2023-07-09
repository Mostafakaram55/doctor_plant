
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_cubit.dart';
import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_state.dart';
import 'package:doctor_plant/Fetutres/homeView/presentation/viewModel/buttom_state.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewModel/bottom_Cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomParCubit,BottomState>(
      listener: (context,state){
        if(state  is BottomPostSate){
          Navigator.pushReplacementNamed(context, NameRout.postsView);
        }
      },
      builder:(context,state){
        var cubit=BottomParCubit.get(context);
        return BlocBuilder<ScanCubit,ScanState>(
          builder: (context,state){
            return  Scaffold(
              body: cubit.screens[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                backgroundColor: ColorManager.buttonColor,
                elevation: 5,
                onPressed:(){
                  Navigator.pushNamed(context, NameRout.postsView);
                },
                splashColor:ColorManager.buttonColor,
                child: const Icon(
                    IconBroken.Edit
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                activeColor: Theme.of(context).disabledColor,
                splashColor: Colors.transparent,
                elevation: 5,
                borderColor: Colors.transparent,
                inactiveColor: Theme.of(context).cardColor,
                height: AppSize.s60.h,
                backgroundColor: Theme.of(context).backgroundColor,
                icons:cubit.icons,
                activeIndex:cubit.currentIndex,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.sharpEdge,
                leftCornerRadius:0,
                rightCornerRadius: 0,
                blurEffect: true,
                onTap: (index){
                  cubit.changBottomNav(index);
                },
                //other params
              ),
            );
          },
        );
      },
    );
  }
}
