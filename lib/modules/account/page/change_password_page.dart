import 'package:do_an/modules/account/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../register/widget/password_filed_widget.dart';

class ChangePasswordPage extends GetView<EditAccountController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          SizedBox(
            height: height(40),
          ),
          Obx(() => buildPasswordField("Nhập mật khẩu", () {
                controller.changeVisibility();
              },
                  controller.isVisibilityPassword.value,
                  controller.passwordController,
                  (value) => controller.validatePassword(value))),
          SizedBox(
            height: height(20),
          ),
          Obx(() => buildPasswordField("Nhập lại mật khẩu", () {
                controller.changeVisibilityRemember();
              },
                  controller.isVisibilityPasswordRemember.value,
                  controller.passwordRememberController,
                  (value) => controller.validateRememberPassword(value))),
          SizedBox(
            height: height(50),
          ),
          ButtonApply(
            tittle: "Thay đổi mật khẩu",
            style: AppStyles.textNormalWhiteSemiBold,
            onClick: () {},
            width: double.infinity,
            height: height(55),
            margin: EdgeInsets.symmetric(
                horizontal: width(20), vertical: height(15)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: greenMoney),
          )
        ],
      ),
    );
  }
}
