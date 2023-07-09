import 'dart:convert';
import 'dart:io';

import 'package:doctor_plant/Fetutres/Home/presentation/viewModel/scan_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ScanCubit extends Cubit<ScanState>{
  ScanCubit(): super(InitialScanState());
  static ScanCubit get(BuildContext context)=>BlocProvider.of(context);
  File? selectedImage;
  String? Prediction = "";
  double confidence = 0;
  Future takeImage()async
  {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    selectedImage = File(pickedImage.path);
  }
  Future uploadImage() async {
    await takeImage();
    //emit(SuccessScanState());
    Prediction = "";
    confidence = 0;
    emit(LoadingScanState());
    final request = http.MultipartRequest(
        "post", Uri.parse("https://f47c-196-157-106-58.ngrok-free.app/predict"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      selectedImage!.path,
    ));

    final response = await request.send();
    if (response.statusCode != 200) return;

    final resJson = await response.stream.bytesToString().then(jsonDecode);
    emit(SuccessScanState());
    return resJson;
  }

}