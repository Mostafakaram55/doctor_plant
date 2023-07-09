
import 'package:doctor_plant/Fetutres/profileView/presentation/view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProFileView extends StatelessWidget {
  const ProFileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const ProFileViewBody(),
    );
  }
}
