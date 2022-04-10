import 'dart:developer';

import 'package:do_an/config/config.dart';
import 'package:do_an/modules/modules.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

class RegisterPage extends GetView<RegisterController>{
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
              buildTextEmailField(
                  tittle: "Tên của bạn",
                  textEditingController: controller.nameController,
                  hintText: "Nhập tên của bạn"),
              buildTextEmailField(
                  tittle: "Số điện thoại",
                  textEditingController: controller.phoneController,
                  hintText: "Nhập số điện thoại"),
              Obx(() => buildTextPasswordField(
                  tittle: "Mật khẩu",
                  textEditingController: controller.passwordController,
                  hintText: "Nhập mật khẩu",
                  isVisibility: controller.isVisibilityPassword.value,
                  changeVisibility: controller.changeVisibility)),
              buildTernCondition(),
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
  Widget buildTernCondition () {
    return Padding(
      padding: EdgeInsets.only(left: width(12), top: height(0), bottom: height(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start ,
        children: [
          Obx(() => Checkbox(
            value: controller.termCondition.value,
            activeColor: greenMoney,
            onChanged: (value){
              controller.changeTermCondition(value);
            },
          )),
          SizedBox(
            width: width(8),
          ),
          Expanded(child: Padding(
            padding:  EdgeInsets.only(top: height(7),right: width(16)),
            child: RichText(
              text: TextSpan(
                  text : "Khi bạn đăng ký, bạn đồng ý với chúng tôi về ",
                  style: AppStyles.textSmallBlackMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: "điều khoản chính sách về dịch vụ và quy định của app. ",
                      style: AppStyles.textSmallGreenMedium,
                      recognizer: TapGestureRecognizer()..onTap = () => log("to privacy"),
                    )
                  ]
              ),
            ),
          ))
        ],
      ),
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
