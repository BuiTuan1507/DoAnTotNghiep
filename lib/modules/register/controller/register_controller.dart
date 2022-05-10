
import 'dart:developer';

import 'package:do_an/models/register/register_model.dart';
import 'package:do_an/models/register/register_user_model.dart';
import 'package:do_an/modules/modules.dart';
import 'package:do_an/respository/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../models/response_model.dart';
import '../../../models/user/user_model.dart';
import '../../../respository/register_repository.dart';
import '../../../service/share_prefencers/global_data.dart';
import '../../../utils/widget/dialog.dart';

class RegisterController extends GetxController{


  RxBool isLoading = false.obs;

  RegisterRepository registerRepository = RegisterRepository();


  void clear(){
    bool isRegisterNameController = Get.isRegistered<NameRegisterController>();
    bool isRegisterInfoController = Get.isRegistered<InfoAccountRegisterController>();
    if(isRegisterNameController) {
      NameRegisterController nameRegisterController = Get.find();
      nameRegisterController.firstNameController.clear();
      nameRegisterController.lastNameController.clear();
    }
    if(isRegisterInfoController) {
      InfoAccountRegisterController infoAccountRegisterController = Get.find();
      infoAccountRegisterController.phoneController.clear();
      infoAccountRegisterController.passwordController.clear();
      infoAccountRegisterController.passwordRememberController.clear();
    }
  }

  Future<void> register (BuildContext context) async{


    bool isRegisterSuccess = false;
    RegisterUserModel registerUserModel = RegisterSingleton.getModel();


    Map<String, dynamic> param = {
      "phoneNumber": registerUserModel.phoneNumber,
      "password": registerUserModel.password,
      "uuid":"",
      "firstName":registerUserModel.firstName,
      "lastName":registerUserModel.lastName,
      "birthDay":registerUserModel.birthDay,
      "male":registerUserModel.sexUser
    };
    try {
      isLoading.value = true;

      ResponseModel responseModel =
      await registerRepository.apiRegister(param);
      if (responseModel.status) {

        RegisterModel dataResponse =
        RegisterModel.fromJson(responseModel.data);

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

        isRegisterSuccess = true;
      }else{
        MyDialog.popUpErrorMessage(buildContext: context, content: responseModel.message, tittle: "Đăng ký thất bại");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      MyDialog.popUpErrorMessage(buildContext: context, content: "Lỗi không xác định", tittle: "Lỗi");
      log(e.toString());
    }


    if(isRegisterSuccess)  Get.toNamed(RouterLink.registerLoading);
  }
}