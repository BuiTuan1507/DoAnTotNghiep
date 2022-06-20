
import 'package:do_an/modules/login/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../widgets/email_field.dart';

class ForgetPasswordPage extends GetView<ForgetPasswordController>{
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "Quên mật khẩu",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildTittle(),
            BuildTextEmailField(
                tittle: "",
                textEditingController: controller.phoneController,
                hintText: "Nhập số điện thoại",
                onChanged: (text) {
                  controller.validateLogin(text);
                }
            ),
            SizedBox(
              height: height(60),
            ),
            Obx(()=> buttonForgetPassword(context, controller.isValidateLogin.value ? greenMoney : grey_3),),
          ],
        ),
      ),
    );
  }

  Widget buildTittle() {
    return Container(
      padding: EdgeInsets.only(top: height(70), bottom: height(20)),
      child: Center(
        child: Text("Nhập số điện thoại của bạn", style: AppStyles.textNormalBlackRegular,),
      ),
    );
  }
  Widget buttonForgetPassword(BuildContext context, HexColor color) {
    return ButtonApply(
      tittle: "Gửi",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick:() => controller.getOTP(),
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: color),
    );
  }

}