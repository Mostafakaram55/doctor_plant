
import 'package:flutter/material.dart';

import 'widgets/edit_profie_view_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const EditProfileBody(),
    );
  }
}
