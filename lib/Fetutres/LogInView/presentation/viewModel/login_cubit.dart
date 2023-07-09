
import 'package:doctor_plant/Fetutres/LogInView/presentation/viewModel/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/share_data.dart';
import '../../../../core/resources/shared_pref.dart';
class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialLoginState());
static LoginCubit get(context)=>BlocProvider.of(context);
  bool chick=false;
void changIcon(){
  chick=!chick;
  emit(ChangIconState());
}
void userLogin({
  required String email,
  required String password,
}){
  emit(LoadingLoginState());
  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
  ).then((value) {
    emit(SuccessLoginState(value.user!.uid));
    print('0000000000000000');
    print(value.user!.email);
    Shared.saveData(key: 'uId', value:value.user!.uid );
    //uId=value.user!.uid;
    print(value.user!.uid);
    print('0000000000000000');
  }).catchError((error){
    emit(ErrorLoginState(error.toString()));
  });
}

}