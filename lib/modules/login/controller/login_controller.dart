import 'dart:developer';

import 'package:do_an/models/login/login_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/respository/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isVisibilityPassword = false.obs;

  LoginRepository loginRepository = Get.find();

  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }

  void clear(){
    phoneController.clear();
    passwordController.clear();
  }
  bool validateLogin(){
    return true;
  }
  Future<void>login () async{
    String _phone = phoneController.text.trim();
    String _password = passwordController.text.trim();
    if(validateLogin()){
      Map<String,dynamic> param = {
        "phoneNumber":_phone,
        "password":_password
      };
      try{
        ResponseModel responseModel = await loginRepository.apiGetListComment(param);
        if(responseModel.status){
          LoginDataResponse dataResponse = LoginDataResponse.fromJson(responseModel.data);
          log(dataResponse.token.toString());
        }
      }catch(e){
        log(e.toString());
      }

    }
  }
}
