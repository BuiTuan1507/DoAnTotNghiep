import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isVisibilityPassword = false.obs;

  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }

  void clear(){
    phoneController.clear();
    passwordController.clear();
  }
  Future<void>login () async{

  }
}
