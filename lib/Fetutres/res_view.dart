import 'dart:io';

import 'package:flutter/material.dart';

class Res extends StatelessWidget {
  const Res(
      {Key? key,
      required this.imagePath,
      required this.prediction,
      required this.confidence})
      : super(key: key);

  final File imagePath;
  final String prediction;

  final double confidence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Container(
            width: 100,
              height: 300,
              child: Image.file(
                  imagePath,
                fit: BoxFit.cover,
              )
          ),
          Text(
              prediction,
          ),
          Text(
            confidence.toString(),
          ),
        ],
      ),
    );
  }
}
