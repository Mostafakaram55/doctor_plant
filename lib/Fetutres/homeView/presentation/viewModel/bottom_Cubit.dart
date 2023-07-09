import 'package:doctor_plant/Fetutres/PostsView/presentation/view/posts_view.dart';
import 'package:doctor_plant/Fetutres/SocialView/presentation/view/SocialView.dart';
import 'package:doctor_plant/Fetutres/homeView/presentation/viewModel/buttom_state.dart';
import 'package:doctor_plant/Fetutres/settingsView/presentation/presentation/view/settings_view.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Home/presentation/view/home_treat.dart';
import '../../../profileView/presentation/view/profile_view.dart';

class BottomParCubit extends Cubit<BottomState>{

  BottomParCubit(): super(BottomInitialSate());
  static BottomParCubit get(BuildContext context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screens=[
    const HomeTreat(),
    const SocialView(),
    const SettingView(),
    const ProFileView(),
  ];
List<IconData>icons=[
  IconBroken.Home,
  IconBroken.Document,
  IconBroken.Setting,
  IconBroken.Profile
];
  void changBottomNav(int index){
  currentIndex=index;
  emit(BottomChangeSate());
}
}