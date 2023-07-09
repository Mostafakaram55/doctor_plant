import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_plant/Fetutres/PostsView/data/post_model.dart';
import 'package:doctor_plant/Fetutres/PostsView/presentation/viewModel/post_state.dart';
import 'package:doctor_plant/core/resources/share_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import '../../../../core/resources/shared_pref.dart';
import '../../../RegisterView/data/models/user_create.dart';
import '../../data/like_model.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit(): super (CratePostInitial());
  static PostCubit get(BuildContext context)=>BlocProvider.of(context);
  SocialUserModel? userCreate;

  void getUserData() {
    emit(AppGetUserLoadingState());
  //print('ana henaaaa uid ${uId}');
    FirebaseFirestore.instance.collection('users').doc(Shared.getDate(key: 'uId')).get().then((value) {
      userCreate =
          SocialUserModel.fromJson(value.data() as Map<String, dynamic>);
      print(userCreate!.name);
      print(userCreate!.phone);
      print(userCreate!.uId);
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      emit(AppGetUserErrorState(error.toString()));
    });
  }
  File? image;
  final picker=ImagePicker();
  Future postImage() async {
    XFile? pickedFile =await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      image = File(pickedFile.path);
      emit(UploadPostImageSuccess());
    }else{
      print('Image not Found');
      emit(UploadPostImageError());
    }
  }

void removePostImage(){
  image=null;
  emit(RemovePostSuccess());
}
  void uploadPostImage({
    required String dataTime,
    required String text,
  })
  {
    emit(CratePostLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print('hkhasssssssssssssssssssssssssssssssssssssssssssssssssssssss55');
        createPost(
          dataTime: dataTime,
          text: text,
          postImage:value, //علشان انا رفعتها
        );
        print('oooooooooooooooo');
      }).catchError((error){

        emit(CratePostError(error.toString()));
        print(error.toString());
      });
    }).catchError((error){
      emit(CratePostError(error.toString()));
      print(error.toString());
    });
  }

   Future <void> createPost({
     required String dataTime,
     required String text,
    String? postImage,
  }) async{
    emit(CratePostLoading());
    print('انا هناااااااااااااا');
    print(userCreate!.name);
    print(userCreate!.image);
    print(userCreate!.uId);
    PostModel model=PostModel(
      name:userCreate!.name,
      image:userCreate!.image,
      uId:userCreate!.uId,
      text: text,
      dataTime: dataTime,
      postImage: postImage??'',
    );
    print('3333333333انا هناااااااااااااا');
    await FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      //Navigator.pop(context);
      emit(CratePostSuccess());
    }).catchError((error){
      emit(CratePostError(error.tostring()));
    });
  }

//get posts method...
  List<PostModel>userPostsData=[];

  void getPosts(){
    emit(GetPostsLoading());
    FirebaseFirestore.instance.collection('posts').get().then((value){
      for (var element in value.docs) {
        userPostsData.add(PostModel.fromJson(element.data()));
        print('/////////////////////');
        print(element.data());
        print('/////////////////////');
      }
      emit(GetPostsSuccess());
    }).catchError((error){
      emit(GetPostsError(error.toString()));
      print(error.toString());
    });
  }


  void likePost({required String postId,required String postMakerID }){
    final model = LikeDataModel(userCreate!.uId!,userCreate!.name,true);
    FirebaseFirestore.instance.collection('users').doc(postMakerID).collection('posts').doc(postId).collection('likes').doc(userCreate!.uId).set(model.toJson()).then((value){
    });
    emit(SuccessLikeState());
  }
}