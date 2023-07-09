
import 'package:doctor_plant/Fetutres/SocialView/presentation/view/Social_view_body.dart';
import 'package:flutter/material.dart';
class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const SocialViewBody(),
    );
  }
}
