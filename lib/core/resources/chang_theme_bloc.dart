import 'package:doctor_plant/core/resources/change_states.dart';
import 'package:doctor_plant/core/resources/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeAppMode extends Cubit<ChangeStates>{
  ChangeAppMode():super(InitialStates());
  static ChangeAppMode get(BuildContext context)=>BlocProvider.of(context);
  bool isDark=false;
  void changeMode({
    bool? fromShared,
}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeStates());
    } else {
      isDark = !isDark;
      Shared.putBoolData(key: 'isDark', value: isDark);
      emit(ChangeThemeStates());
      print(isDark);
    }
  }
  bool lang=true;
  void changeLang(){
    lang=!lang;
    emit(ChangeLangStates());
  }
}