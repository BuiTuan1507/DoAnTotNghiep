import 'package:do_an/models/register/sex_type.dart';
import 'package:do_an/utils/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';

class RegisterController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRememberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Rx<DateTime> dateTime = DateTime.now().obs;

  RxBool isVisibilityPassword = true.obs;

  RxBool isVisibilityPasswordRemember = true.obs;

  RxBool termCondition = false.obs;

  RxList<SexType> listSexType  = SexType.listSexType.obs;

  RxBool isValidateFirstName = false.obs;

  RxBool isValidateLastName = false.obs;

  RxBool fistClickName = false.obs;


  RxBool firstClickButtonInfo = false.obs;

  RxBool isValidatePhoneNumber = false.obs;

  RxString currentPassword = "".obs;

  RxBool isLengthPassword = false.obs;

  RxBool isContainSpecificCharacter = false.obs;

  RxBool isContainNumber = false.obs;

  RxBool isSamePassword = false.obs;

  RxBool validateInfoAccount = false.obs;


  bool firstSelectedTime = false;

  bool firstSelectedSex = false;

  RxBool isCheckSelectedSex = false.obs;




  DateTime checkTime = DateTime(DateTime.now().year -13, DateTime.now().month, DateTime.now().day);

  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }
  void changeVisibilityRemember(){
    isVisibilityPasswordRemember.value = !isVisibilityPasswordRemember.value;
  }

  void changeTermCondition (bool? value){
    termCondition.value = value ?? false;
  }


  void validateFirstName (String text){
    isValidateFirstName.value = Validator.name(text) ?? false;
  }
  void validateLastName (String text){
    isValidateLastName.value = Validator.name(
      text
    ) ?? false;
  }

  Future<void> validatePhoneNumber (String text) async{
    await Future.delayed(const Duration(seconds: 1), (){
      isValidatePhoneNumber.value = Validator.validationPhone(text) ;
    });

  }
  void validatePassword (String text) {
    currentPassword.value = text;
    isLengthPassword.value = text.length > 7;
    isContainSpecificCharacter.value = Validator.isCheckUppercase(text);
    isContainNumber.value = Validator.isCheckContainPasswordNumber(text);
  }
  void validateRememberPassword (String text) {
    isSamePassword.value = (text == currentPassword.value);
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && isValidatePhoneNumber.value;
  }
  bool validateRegister(){
    return isValidateFirstName.value && isValidateLastName.value;
  }

  void clear(){
    firstNameController.clear();
    passwordController.clear();
    lastNameController.clear();
  }

  void changeStateSexType(String name){
    int index = listSexType.indexWhere((element) => element.tittle == name);
    if(index == -1) return;
    for (var element in listSexType) {
      element.isSelected = false;
    }
    listSexType[index].isSelected = true;
    listSexType.refresh();
    isCheckSelectedSex.value = true;
  }

  Future<void> register () async{
    String _phone = phoneController.text.trim();
    String _password = passwordController.text.trim();
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