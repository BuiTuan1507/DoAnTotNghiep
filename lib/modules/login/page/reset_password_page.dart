import 'package:do_an/modules/login/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../modules.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height(40),
            ),
            Obx(() => buildPasswordField("Nhập mật khẩu mới", () {
              controller.changeVisibility();
            },
                controller.isVisibilityPassword.value,
                controller.passwordController,
                    (value) => controller.validatePassword(value))),
            SizedBox(
              height: height(20),
            ),
            Obx(() => buildPasswordField("Nhập lại mật khẩu mới", () {
              controller.changeVisibilityRemember();
            },
                controller.isVisibilityPasswordRemember.value,
                controller.passwordRememberController,
                    (value) => controller.validateRememberPassword(value))),
            SizedBox(
              height: height(50),
            ),
            Obx(() => ButtonApply(
              tittle: "Thay đổi mật khẩu",
              style: AppStyles.textNormalWhiteSemiBold,
              onClick: () async {
                await controller.changePasswordAccount(context);
              },
              width: double.infinity,
              height: height(55),
              margin: EdgeInsets.symmetric(
                  horizontal: width(20), vertical: height(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: controller.validateInfoAccount.value ? greenMoney : grey_3),
            ))
          ],
        ),
      ),
    );
  }
}
