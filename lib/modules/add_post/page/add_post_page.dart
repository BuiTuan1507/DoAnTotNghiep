import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class AddPostPage extends GetView<AddPostController>{
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("add modules.post"),
    );
  }

}