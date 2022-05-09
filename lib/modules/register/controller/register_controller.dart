import 'package:do_an/models/register/sex_type.dart';
import 'package:do_an/utils/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';

class RegisterController extends GetxController{





  Future<void> register () async{
 //   String _phone = phoneController.text.trim();
 //   String _password = passwordController.text.trim();
  //  String _userName = nameController.text.trim();
    bool isRegisterSuccess = true;
/*
    if (validateRegister()) {
      Map<String, dynamic> param = {
        "phoneNumber": _phone,
        "password": _password
      };
      try {
        isLoading.value = true;
        ResponseModel responseModel =
        await loginRepository.apiLogin(param);
        if (responseModel.status) {

          LoginDataResponse dataResponse =
          LoginDataResponse.fromJson(responseModel.data);
          UserModel newUser = UserModel(
              id: dataResponse.id,
              token: dataResponse.token,
              username: dataResponse.username,
              avatar: dataResponse.avatar,
              active: dataResponse.active,
              phoneNumber: dataResponse.phoneNumber
          );
          GlobalData.setUserLogin(newUser);
          isLoginSuccess = true;
        }else{
          MyDialog.popUpErrorMessage(buildContext: buildContext, content: responseModel.message, tittle: "Đăng nhập thất bại");
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        MyDialog.popUpErrorMessage(buildContext: buildContext, content: "Lỗi không xác định", tittle: "Lỗi");
        log(e.toString());
      }
    }

 */
    if(isRegisterSuccess)  Get.toNamed(RouterLink.registerLoading);
  }
}