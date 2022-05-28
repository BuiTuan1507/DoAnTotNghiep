import 'package:do_an/modules/product_detail/controller/watch_user_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';

class WatchUserPage extends GetView<WatchUserController>{
  const WatchUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Bùi Minh Tuấn", style: AppStyles.textNormalWhiteSemiBold),
        backgroundColor: greenMoney,
      ),
    );
  }

}