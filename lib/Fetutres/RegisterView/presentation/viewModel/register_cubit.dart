import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_plant/Fetutres/RegisterView/data/models/user_create.dart';
import 'package:doctor_plant/Fetutres/RegisterView/presentation/viewModel/register_state.dart';
import 'package:doctor_plant/core/resources/share_data.dart';
import 'package:doctor_plant/core/resources/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(InitialRegisterState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  bool chick=false;
  bool chickConfirm=false;
  void changIcon(){
    chick=!chick;
    emit(ChangeIconRegisterState());
    chick=chick;
  }
  void changConfirmIcon(){
    chickConfirm=!chickConfirm;
    emit(ChangeAnIconRegisterState());
  }
  void userRegister({
  required String userName,
  required String email,
  required String phone,
  required String password,
  required String confirmPassword,
})
{
emit(LoadingRegisterState());
FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:email,
    password: password,
).then((value) {
  print('*****************');
  print(value.user!.email);
  print(value.user!.uid);
  Shared.saveData(key: 'uId', value:value.user!.uid );
  //uId=value.user!.uid;
  print('****************');
  userCreate(
    uId: value.user!.uid,
    phone: phone,
    email:email,
    userName: userName,
  );
}).catchError((error){
  emit(ErrorRegisterState(error.toString()));
});
}
//create user.
void userCreate({
  required email,
  required userName,
  required phone,
  required uId,
})
{
  //create users collection...
  SocialUserModel userCreate=SocialUserModel(
    email: email,
    name:userName,
    phone: phone,
    uId: uId,
    image:'https://www.shutterstock.com/image-photo/high-mountain-morning-time-beautiful-600w-1384588922.jpg',
  );
  //toMap ->عبارة عن ميثود انا عاملها هناك في الموديل
FirebaseFirestore.instance.collection('users').doc(uId).set(userCreate.toMap()).then((value){
  emit(CreateUserSuccess());
}).catchError((error){
  emit(CreateUserError(error.toString()));
  print(error.toString());
});
}
}