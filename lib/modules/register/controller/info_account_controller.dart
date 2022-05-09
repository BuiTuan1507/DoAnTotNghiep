import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class InfoAccountRegisterController extends GetxController{
  late FocusNode phoneNumberFocusNode ;

  RxBool isValidatePhoneNumber = false.obs;

  RxString currentPassword = "".obs;

  RxBool isLengthPassword = false.obs;

  RxBool isContainSpecificCharacter = false.obs;

  RxBool isContainNumber = false.obs;

  RxBool isSamePassword = false.obs;

  RxBool validateInfoAccount = false.obs;

  RxBool isVisibilityPassword = true.obs;

  RxBool isVisibilityPasswordRemember = true.obs;

  RxBool firstClickButtonInfo = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRememberController = TextEditingController();

  @override
  void onInit() {
    phoneNumberFocusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  Future<void> validatePhoneNumber (String text) async{
    await Future.delayed(const Duration(seconds: 1), (){
      isValidatePhoneNumber.value = Validator.validationPhone(text) ;
      validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && isValidatePhoneNumber.value;
    });

  }
  void validatePassword (String text) {
    currentPassword.value = text;
    isLengthPassword.value = text.length > 7;
    isContainSpecificCharacter.value = Validator.isCheckUppercase(text);
    isContainNumber.value = Validator.isCheckContainPasswordNumber(text);
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && isValidatePhoneNumber.value;
  }
  void validateRememberPassword (String text) {
    isSamePassword.value = (text == currentPassword.value);
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && isValidatePhoneNumber.value;
  }


  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }
  void changeVisibilityRemember(){
    isVisibilityPasswordRemember.value = !isVisibilityPasswordRemember.value;
  }


}