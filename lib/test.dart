import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:doctor_plant/core/resources/route_Manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  File? selectedImage;
  String? Prediction = "";
  double confidence = 0;
  Future uploadImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    selectedImage = File(pickedImage.path);
    setState(() {
      Prediction = "";
      confidence = 0;
    });

    final request = http.MultipartRequest(
        "post", Uri.parse("https://0e4b-41-35-78-72.ngrok-free.app/predict"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      selectedImage!.path,
    ));

    final response = await request.send();
    if (response.statusCode != 200) return;

    final resJson = await response.stream.bytesToString().then(jsonDecode);
    return resJson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: selectedImage == null
          ? const Center(
              child: Text("NO image selected"),
            )
          : Prediction != ""
              ? SingleChildScrollView(
                  child: Column(children: [
                  Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.file(
                            selectedImage!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              Prediction!,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'confidence is: $confidence%',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ))
                ]))
              : const Center(
                  child: CircularProgressIndicator(color: Colors.green),
                ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 21, 89, 23),
          onPressed: () {
            uploadImage().then((value) {
              Navigator.pushNamed(context, NameRout.result,
                  arguments: ResultVariables(
                      imagePath: selectedImage!,
                      prediction: value['Prediction'],
                      confidence: value['confidence']));
            });
          },
          child: const Icon(
            Icons.image,
            color: Colors.white,
          )),
    );
  }
}
