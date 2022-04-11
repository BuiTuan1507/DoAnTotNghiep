import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../modules.dart';

class HomePage extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home page"),
    );
  }

}
