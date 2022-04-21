import 'dart:developer';

import 'package:do_an/config/config.dart';
import 'package:do_an/modules/modules.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

class RegisterPage extends GetView<RegisterController>{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildLogoRegister(),
              SizedBox(
                height: height(30),
              ),
              buildTittle(),
              SizedBox(
                height: height(30),
              ),

              Obx(() => buildTextPasswordField(
                  tittle: "Mật khẩu",
                  textEditingController: controller.passwordController,
                  hintText: "Nhập mật khẩu",
                  isVisibility: controller.isVisibilityPassword.value,
                  changeVisibility: controller.changeVisibility)),

              buildButtonRegister(),
              textHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
  Widget buildLogoRegister(){
    return Container();
  }
  Widget buildTittle(){
    return  Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddingMedium, vertical: paddingMedium),
      child: Text(
        "Đăng kí",
        style: AppStyles.textXLBlackSemiBold,
      ),
    );
  }
  Widget buildButtonRegister(){
    return ButtonApply(
      tittle: "Đăng kí",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: controller.register,
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: greenMoney),
    );
  }



  Widget textHaveAccount() {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: height(20)),
          child: RichText(
            text: TextSpan(
              text: 'Đã có tài khoản ?  ',
              style: GoogleFonts.sarabun(
                  fontSize: size(14),
                  fontWeight: FontWeight.w400,
                  color: lightDarkHintText),
              children: <TextSpan>[
                TextSpan(
                  text: 'Đăng nhập',
                  style: GoogleFonts.sarabun(
                      fontSize: size(14),
                      fontWeight: FontWeight.w600,
                      color:greenMoney),
                  recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(RouterLink.login),

                )
              ],
            ),
          )),
    );
  }

}
