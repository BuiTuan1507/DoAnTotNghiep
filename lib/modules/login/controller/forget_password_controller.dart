import 'package:do_an/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController phoneController = TextEditingController(text: "");

  RxBool isValidateLogin = false.obs;

  void validateLogin(String text){
    if(text != ""){
      isValidateLogin.value = true;
    }
  }
  Future<void> getOTP() async {
  Get.toNamed(RouterLink.otpPage, arguments: phoneController.text.trim());
  }
}