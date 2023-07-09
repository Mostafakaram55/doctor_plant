import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_plant/Fetutres/RegisterView/data/models/user_create.dart';
import 'package:doctor_plant/Fetutres/profileView/presentation/viewModel/profile_state.dart';
import 'package:doctor_plant/core/resources/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/resources/share_data.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

import '../../../PostsView/data/post_model.dart';
class ProfileCubit extends Cubit<ProfileState>{
   ProfileCubit():super(InitialProfileState());
  static ProfileCubit get(context)=>BlocProvider.of(context);
   SocialUserModel? userCreate;
   File? image;
   final picker=ImagePicker();
   var pickedImage;
   XFile? _imageFiles;
   Future uploadImage() async {
     pickedImage= await picker.pickImage(source: ImageSource.gallery);
     if(pickedImage != null){
       image = File(pickedImage!.path);
       _imageFiles = pickedImage;
       print(_imageFiles);
       emit(SuccessEditImageProfileState());
     }else{
       print('Image not Found');
       emit(ErrorEditImageProfileState());
     }
   }

  void getUserData(){
    emit(LoadingProfileState());
    FirebaseFirestore.instance.collection('users').doc(Shared.getDate(key: 'uId')).get().then((value) {
      userCreate=SocialUserModel.fromJson(value.data()!);
      print('============%%');
      print(value.data());
      print('============%%');
      emit(SuccessProfileState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorProfileState(error));
    });
  }
  Future uploadProfileImage(File file) async{
      firebase_storage.
      FirebaseStorage.instance.ref().
      child('users/${Uri.file(pickedImage.path).pathSegments.last}').putFile(pickedImage).then((value){
        value.ref.getDownloadURL().then((value) {
          print('+++++++++++++++++++');
         print(value);
         print('+++++++++++++++++++');
       }).catchError((error){
         print('pppppppppppppppppppp');
         print(error.toString());
         print('pppppppppppppppppppp');
        });
      }).catchError((error){
      });


  }

  void updateUserData({
  required name,
  required phone,
  //required image,
}){
     emit(LoadingEditProfileState());
     SocialUserModel model =SocialUserModel(
        name: name,
        phone: phone,
       email: userCreate!.email,
      image: userCreate!.image,
      uId: userCreate!.uId
    );
     FirebaseFirestore.instance.collection('users').doc(model.uId).update(model.toMap()).then((value) {
       getUserData();
     }).catchError((error){
       emit(ErrorEditUserDataState(error.tostring()));
     });
  }
}