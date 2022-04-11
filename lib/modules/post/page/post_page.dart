import 'package:do_an/modules/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PostPage extends GetView<PostController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Post"),
    );
  }

}