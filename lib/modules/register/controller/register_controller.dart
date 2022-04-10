import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RxBool isVisibilityPassword = false.obs;
  RxBool termCondition = false.obs;

  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }
  void changeTermCondition (bool? value){
    termCondition.value = value ?? false;
  }

  void clear(){
    nameController.clear();
    passwordController.clear();
    nameController.clear();
  }

  Future<void> register () async{

  }
}