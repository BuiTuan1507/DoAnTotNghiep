import 'package:do_an/utils/common/common_util.dart';
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

  Future<void> getUserInfo(BuildContext context) async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    try {
      Map<String, dynamic> params = {"token": token, "userId": userId};
      ResponseModel responseModel =
          await userRepository.apiGetUserInfo(param: params, token: token);
      if (responseModel.status) {
        UserInfoModel userInfoModel =
            UserInfoModel.fromJson(responseModel.data);
        infoUser.value = userInfoModel;
        listAddress.value = userInfoModel.listAddress ?? [];

        if (listAddress.isNotEmpty) {
          ListAddress address = listAddress.firstWhere((element) => element.id == infoUser.value.selectedId, orElse:() => ListAddress());
          int index = listAddress.indexOf(address);
          if(index == -1) return ;
          address.isSelected = true;
          listAddress[index] = address;
          selectedAddress.value = address;
        }
      } else {
        MyDialog.popUpErrorMessage(
            buildContext: context,
            content: responseModel.message,
            tittle: "Lấy thông tin người dùng thất bại");
      }
    } catch (e) {
      MyDialog.popUpErrorMessage(
          buildContext: context, content: e.toString(), tittle: "Lỗi");
      log(e.toString());
    }
  }

  void changeStatusAddress(ListAddress address) {
    selectedAddress.value = address;
    int index = listAddress.indexOf(address);
    if (index == -1) return;
    for (var item in listAddress) {
      item.isSelected = false;
    }
    listAddress[index] = address.copyWith(isSelected: true);
  }

  String getAddress(ListAddress address) {
    return (address.street ?? "") +
        "," +
        (address.ward ?? "") +
        "," +
        (address.district ?? "") +
        "," +
        (address.province ?? "");
  }

  Future<void> confirmAddress() async {
    ListAddress selectedAddress = infoUser.value.listAddress?.firstWhere(
            (element) => element.isSelected == true,
            orElse: () => ListAddress()) ??
        ListAddress();
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "id": selectedAddress.id
      };
      ResponseModel responseModel = await userRepository.apiChangeAddress(param: params, token: token);
      if(responseModel.status){
        Get.back(result: selectedAddress);
      }else{
        CommonUtil.showToast("Lỗi server");
      }
    } catch (e) {
      log(e.toString());
      CommonUtil.showToast("Lỗi server");
    }
  }
  Future<void> deleteAddress(ListAddress address) async {
    if(address.isSelected == false){
      try {
        String token = GlobalData.getUserModel().token ?? "";
        int userId = GlobalData.getUserModel().id ?? 0;
        Map<String, dynamic> params = {
          "token": token,
          "userId": userId,
          "id": address.id
        };
        ResponseModel responseModel = await userRepository.apiDeleteAddress(param: params, token: token);
        if(responseModel.status){
          listAddress.removeWhere((element) => element.id == address.id);
          listAddress.refresh();
        }else{
          CommonUtil.showToast("Lỗi server");
        }
      } catch (e) {
        log(e.toString());
        CommonUtil.showToast("Lỗi server");
      }
    }

  }
}
