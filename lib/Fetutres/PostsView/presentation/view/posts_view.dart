
import 'package:flutter/material.dart';
import 'postas_View_body.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body:  PostsViewBody(),
    );
  }
}
