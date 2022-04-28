import 'package:do_an/modules/account/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';

class ChangePasswordPage extends GetView<EditAccountController>{
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text(
          "Thay đổi mật khẩu",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

        ],
      ),
    );
  }

}