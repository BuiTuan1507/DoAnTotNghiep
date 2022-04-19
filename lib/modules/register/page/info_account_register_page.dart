import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';
import '../controller/register_controller.dart';

class InfoAccountRegisterPage extends StatefulWidget {
  const InfoAccountRegisterPage({Key? key}) : super(key: key);

  @override
  State<InfoAccountRegisterPage> createState() =>
      _InfoAccountRegisterPageState();
}

class _InfoAccountRegisterPageState extends State<InfoAccountRegisterPage> {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height(120),
              ),
              Center(
                child: Text(
                  "Nhập thông tin tài khoản của bạn ?",
                  style: AppStyles.textLargeGreenSemiBold,
                ),
              ),
              SizedBox(
                height: height(30),
              ),
              buildPhoneNumberField(),
              SizedBox(
                height: height(30),
              ),
              Obx(() => buildPasswordField(
                  "Nhập mật khẩu",
                      () {
                    controller.changeVisibility();
                  }, controller.isVisibilityPassword.value, controller.passwordController)),
              SizedBox(
                height: height(30),
              ),
              Obx(() => buildPasswordField("Nhập lại mật khẩu", (){
                controller.changeVisibilityRemember();
              },controller.isVisibilityPasswordRemember.value, controller.passwordRememberController)),

              Padding(
                padding: EdgeInsets.only(top: height(30)),
                child: buttonNext(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        child: TextFormField(
          controller: controller.phoneController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "Số điện thoại",
            hintStyle: AppStyles.textSmallDarkNormal,
            contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: lightDarkHintText, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greenMoney, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightDarkHintText, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));
  }

  Widget buildPasswordField(
      String hintText, VoidCallback changeVisibility, bool visibilityPassword, TextEditingController textEditingController) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        child: TextFormField(
          obscureText: visibilityPassword,
          controller: textEditingController,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyles.textSmallDarkNormal,
              contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
              //  fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: lightDarkHintText, width: 1.0),
                borderRadius: BorderRadius.circular(14.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greenMoney, width: 1.0),
                borderRadius: BorderRadius.circular(14.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightDarkHintText, width: 1.0),
                borderRadius: BorderRadius.circular(14.0),
              ),
              suffixIcon: IconButton(
                  icon: Icon(visibilityPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: visibilityPassword
                      ? greenMoney
                      : lightDarkHintText,
                  onPressed: changeVisibility)),
        ));
  }

  Widget buttonNext(){
    void toPage(){
      Get.toNamed(RouterLink.registerDateAndSex);
    }
    return ButtonApply(
      tittle: "Tiếp theo",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: toPage,
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: greenMoney),
    );
  }
}
