
import 'dart:developer';
import 'dart:io';

import 'package:do_an/models/user/user_info_model.dart';
import 'package:do_an/respository/user_repository.dart';
import 'package:do_an/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/routes_link.dart';
import '../../../models/models.dart';
import '../../../respository/login_repository.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/utils.dart';
import '../../login/page/login_page.dart';

class AccountController extends GetxController {

  LoginRepository loginRepository = LoginRepository();

  UserRepository userRepository = UserRepository();

  Rx<UserInfoModel> infoUser = UserInfoModel().obs;

  RxString name = "Minh tuan".obs;
  RxString image = Constants.AVATAR_URL.obs;

  Rx isLoading = false.obs;



  @override
  void onInit() async {

    super.onInit();
  }

  Future<void> logout(BuildContext context) async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      Map<String,dynamic> params = {
        "token": token
      };
      ResponseModel model = await loginRepository.apiLogout(param: params,token: token);

      if(model.status){
        await GlobalData.clearUser();
        Get.offAll(()=> LoginPage());
      }else {
        MyDialog.popUpErrorMessage(buildContext: context, content: model.message, tittle: "Có lỗi xảy ra");
        Get.offAll(()=> LoginPage());
      }
    } catch (e){
      MyDialog.popUpErrorMessage(buildContext: context, content: "Lỗi không xác định", tittle: "Lỗi");
      Get.offAll(()=> LoginPage());
      log(e.toString());
    }
  }

  Future<void> getUserInfo(BuildContext context) async{

    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    try{
      Map<String,dynamic> params = {
        "token":token,
        "userId":userId
      };
      ResponseModel responseModel = await userRepository.apiGetUserInfo(param: params, token: token);
      if(responseModel.status){
        UserInfoModel userInfoModel = UserInfoModel.fromJson(responseModel.data);
        infoUser.value = userInfoModel;
      }else {
        MyDialog.popUpErrorMessage(buildContext: context, content: responseModel.message, tittle: "Lấy thông tin người dùng thất bại");
      }
    }catch(e){
      MyDialog.popUpErrorMessage(buildContext: context, content: e.toString(), tittle: "Lỗi");
      log(e.toString());
    }
  }


  void toPageBuy(){
    Get.toNamed(RouterLink.purchaseOrderPage);
  }

  void toPageSell(){
    Get.toNamed(RouterLink.sellOrderPage);
  }

  void toPageSavePost(){
    Get.toNamed(RouterLink.savePostPage);
  }

  void toPageFriend(){
    Get.toNamed(RouterLink.friendUserPage);
  }

  void toPageSetting(){
    Get.toNamed(RouterLink.editProfileDetailPage);
  }




}
