import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/shared_pref.dart';
import 'chang_mode_state.dart';

class ChangMode extends Cubit<ChangModeState>{

  ChangMode():super(ChangInitialState());
  static ChangMode get(BuildContext context)=>BlocProvider.of(context);
  bool isDark=true;

  void changeAppMode({
    bool? fromShared,
  }){
    if(fromShared !=null){
      isDark=fromShared;
      emit(ChangModeSuccessState());
    }else{
      isDark=!isDark;
      Shared.putBoolData(key: 'isDark', value: isDark).then((value){
        emit(ChangModeSuccessState());
      });
    }
  }
}