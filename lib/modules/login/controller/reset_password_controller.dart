import 'dart:developer';

import 'package:do_an/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/response_model.dart';
import '../../../service/service.dart';
import '../../../utils/common/validator.dart';
import '../../../utils/utils.dart';

class ResetPasswordController extends GetxController{
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordRememberController = TextEditingController();

  /// password
  RxString currentPassword = "".obs;

  RxBool isLengthPassword = false.obs;

  RxBool isContainSpecificCharacter = false.obs;

  RxBool isContainNumber = false.obs;

  RxBool isSamePassword = false.obs;

  RxBool validateInfoAccount = false.obs;


  RxBool isVisibilityPassword = true.obs;

  RxBool isVisibilityPasswordRemember = true.obs;

  RxBool isVisibilityOldPassword = true.obs;

  void validatePassword (String text) {
    currentPassword.value = text;
    isLengthPassword.value = text.length > 7;
    isContainSpecificCharacter.value = Validator.isCheckUppercase(text);
    isContainNumber.value = Validator.isCheckContainPasswordNumber(text);
    isSamePassword.value = (text == passwordRememberController.text.trim());
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value ;
  }
  void validateRememberPassword (String text) {
    isSamePassword.value = (text == currentPassword.value);
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value ;
  }

  Future<void> changePasswordAccount(BuildContext context) async {
    if(validateInfoAccount.value){
      FocusManager.instance.primaryFocus?.unfocus();
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      try{
        Map<String,dynamic> param = {
          "token":token,
          "userId":userId,
        //  "oldPassword":oldPasswordController.text.trim(),
          "newPassword":passwordController.text.trim()
        };
     //   ResponseModel responseModel = await userRepository.apiChangePassword(param: param, token: token);
     //   oldPasswordController.clear();
        passwordRememberController.clear();
        passwordController.clear();
        /*
        if(responseModel.status){
          CommonUtil.showToast("Thay đổi mật khẩu thành công", isSuccessToast: true);
        }else {
          MyDialog.popUpErrorMessage(buildContext: context, content: "Lỗi thay đổi mật khẩu", tittle: responseModel.message);
        }

         */
        Get.toNamed(RouterLink.login);
      }catch(e){
        log(e.toString());
        Get.toNamed(RouterLink.login);
      }

    }else{
      if(isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value ){

      }else{
        CommonUtil.showToast("Mật khẩu mới nên có đủ 8 kí tự bao gồm chữ in hoa và số");
        return;
      }
      if(isSamePassword.value){
      }else{
        CommonUtil.showToast("Mật khẩu mới nhập lại phải giống nhau");
      }
    }
  }
  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }
  void changeVisibilityRemember(){
    isVisibilityPasswordRemember.value = !isVisibilityPasswordRemember.value;
  }
}