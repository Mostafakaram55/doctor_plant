
import 'package:flutter/material.dart';
import 'home_treat_body.dart';
class HomeTreat extends StatelessWidget {
  const HomeTreat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:const HomeTreatBody(),
    );
  }
}
