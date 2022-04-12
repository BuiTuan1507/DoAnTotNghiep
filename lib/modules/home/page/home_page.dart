import 'package:do_an/modules/home/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../modules.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: width(12),
      elevation: 0,
      actions: [],
    );
  }

}
