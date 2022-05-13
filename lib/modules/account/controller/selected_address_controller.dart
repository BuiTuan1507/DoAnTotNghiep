import 'package:get/get.dart';

import '../../../models/user/address_model.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';


import '../../../models/response_model.dart';
import '../../../models/user/user_info_model.dart';
import '../../../respository/user_repository.dart';
import '../../../service/service.dart';
import '../../../utils/widget/dialog.dart';

class SelectedAddressController extends GetxController {

  RxBool isLoading = false.obs;

  Rx<UserInfoModel> infoUser = UserInfoModel().obs;

  UserRepository userRepository = UserRepository();

  RxList<ListAddress> listAddress = <ListAddress>[].obs;

  Rx<ListAddress> selectedAddress = ListAddress().obs;

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
        listAddress.value = userInfoModel.listAddress ?? [];

        if(listAddress.isNotEmpty){
          listAddress.first.isSelected = true;
          selectedAddress.value = listAddress.first;
        }
      }else {
        MyDialog.popUpErrorMessage(buildContext: context, content: responseModel.message, tittle: "Lấy thông tin người dùng thất bại");
      }
    }catch(e){
      MyDialog.popUpErrorMessage(buildContext: context, content: e.toString(), tittle: "Lỗi");
      log(e.toString());
    }
  }

  void changeStatusAddress(ListAddress address){
    selectedAddress.value = address;
    int index = listAddress.indexOf(address);
    for(var item in listAddress){
      item.isSelected = false;
    }
    listAddress[index].isSelected = true;
    listAddress.refresh();
  }
}
