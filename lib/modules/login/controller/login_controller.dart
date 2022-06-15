import 'dart:developer';

import 'package:do_an/respository/login_repository.dart';
import 'package:do_an/service/web_socket.dart';
import 'package:do_an/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../models/login/login_model.dart';
import '../../../models/models.dart';
import '../../../models/user/user_model.dart';
import '../../../service/share_prefencers/global_data.dart';


class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isVisibilityPassword = false.obs;

  LoginRepository loginRepository = Get.put(LoginRepository());

  RxBool isLoading = false.obs;

  RxBool isValidateLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeVisibility() {
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }

  void clear() {
    phoneController.clear();
    passwordController.clear();
  }

  void validateLogin() {
    isValidateLogin.value = phoneController.text.isNotEmpty && passwordController.text.isNotEmpty && validatePhoneNumber(phoneController.text.trim());
  }

  bool validatePhoneNumber(String phoneNumber){
    return Validator.validationPhone(phoneNumber);
  }

  Future<void> login(BuildContext buildContext) async {
    FocusManager.instance.primaryFocus?.unfocus();
    String _phone = phoneController.text.trim();
    String _password = passwordController.text.trim();
    bool isLoginSuccess = false;

    validateLogin();
    if (isValidateLogin.value) {
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
              firstName: dataResponse.firstName,
              lastName: dataResponse.lastName,
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


    if (isLoginSuccess) Get.toNamed(RouterLink.main);
  }

}
