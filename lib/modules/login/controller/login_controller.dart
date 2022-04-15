import 'dart:developer';

import 'package:do_an/models/login/login_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/respository/login_repository.dart';
import 'package:do_an/service/service.dart';
import 'package:do_an/utils/common/web_socket.dart';
import 'package:do_an/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../models/user/user_model.dart';
import '../../../utils/common/dart_notification_center.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isVisibilityPassword = false.obs;

  LoginRepository loginRepository = Get.find();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    onSocket();
    super.onInit();
  }

  void changeVisibility() {
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }

  void clear() {
    phoneController.clear();
    passwordController.clear();
  }

  bool validateLogin() {
    return true;
  }

  Future<void> login(BuildContext buildContext) async {
    String _phone = phoneController.text.trim();
    String _password = passwordController.text.trim();
    bool isLoginSuccess = true;

    /*
    if (validateLogin()) {
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
    if (isLoginSuccess) Get.toNamed(RouterLink.main);
  }

  onSocket() {
    DartNotificationCenter.subscribe(
        channel: '/topic/messages',
        observer: this,
        onNotification: (data) {
          log(data);
        });
  }
}
