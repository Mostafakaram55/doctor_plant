

import 'package:flutter/material.dart';

import '../widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:const SettingsViewBody(),
    );
  }
}
