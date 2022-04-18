import 'dart:developer';

import 'package:do_an/models/models.dart';
import 'package:do_an/modules/login/page/login_page.dart';
import 'package:do_an/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../respository/login_repository.dart';
import '../../../utils/utils.dart';

class AccountController extends GetxController {
  RxString token = "".obs;
  LoginRepository loginRepository = LoginRepository();

  @override
  void onInit() {
    loadDataFromLocal();
    super.onInit();
  }

  void loadDataFromLocal() {
    token.value = GlobalData.getUserModel().token ?? "";
  }

  Future<void> logout(BuildContext context) async {
    //  Get.offAll(()=> LoginPage());
    Get.toNamed(RouterLink.login);
    /*
    try {
      Map<String,dynamic> params = {
        "token":token.value
      };
      ResponseModel model = await loginRepository.apiLogout(param: params,token: token.value);
      if(model.status){
        await GlobalData.clearUser();
        Get.offAll(()=> LoginPage());
      }
    } catch (e){
      MyDialog.popUpErrorMessage(buildContext: context, content: "Lỗi không xác định", tittle: "Lỗi");
      log(e.toString());
    }
     */
  }
}
