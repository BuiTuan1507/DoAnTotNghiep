import 'dart:convert';
import 'dart:developer';

import 'package:do_an/models/models.dart';
import 'package:do_an/modules/account/controller/selected_address_controller.dart';
import 'package:do_an/respository/user_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/user/address_model.dart';
import '../../../service/share_prefencers/global_data.dart';

class AddAddressController extends GetxController {
  RxList<ProvinceAddressModel> listProvince = <ProvinceAddressModel>[].obs;
  RxList<DistrictAddressModel> listDistrict = <DistrictAddressModel>[].obs;
  RxList<WardAddressModel> listWard = <WardAddressModel>[].obs;

  UserRepository userRepository = UserRepository();

  RxBool isLoadingProvince = false.obs;
  RxBool isLoadingDistrict = false.obs;
  RxBool isLoadingWard = false.obs;

  Rx<ProvinceAddressModel> selectedProvinceModel = ProvinceAddressModel().obs;
  Rx<DistrictAddressModel> selectedDistrictAddressModel = DistrictAddressModel().obs;
  Rx<WardAddressModel> selectedWardAddressModel = WardAddressModel().obs;

  final TextEditingController streetController = TextEditingController(text: "");

  @override
  void onInit() async {
    // TODO: implement onInit
    await getListProvince();
    super.onInit();
  }

  Future<void> getListProvince() async {
    try {
      listProvince.clear();
      isLoadingProvince.value = true;
      dynamic _listData = await userRepository.apiGetListProvince();
      for (var item in _listData) {
        listProvince.add(ProvinceAddressModel.fromJson(item));
      }
      isLoadingProvince.value = false;
    } catch (e) {
      isLoadingProvince.value = false;
      log(e.toString());
    }
  }

  Future<void> getListDistrict() async {
    Map<String, dynamic> params = {"provinceId": selectedProvinceModel.value.id};
    try {
      listDistrict.clear();
      isLoadingDistrict.value = true;
      dynamic _listData =
          await userRepository.apiGetListDistrict(param: params);
      for (var item in _listData) {
        listDistrict.add(DistrictAddressModel.fromJson(item));
      }
      isLoadingDistrict.value = false;
    } catch (e) {
      isLoadingDistrict.value = false;
      log(e.toString());
    }
  }

  Future<void> getListWard() async {
    Map<String, dynamic> params = {"provinceId": selectedProvinceModel.value.id, "districtId": selectedDistrictAddressModel.value.id};
    try {
      listWard.clear();
      isLoadingWard.value = true;
      dynamic _listData = await userRepository.apiGetListWard(param: params);
      for (var item in _listData) {
        listWard.add(WardAddressModel.fromJson(item));
      }
      isLoadingWard.value = false;
    } catch (e) {
      isLoadingWard.value = false;
      log(e.toString());
    }
  }

  void selectedProvince(ProvinceAddressModel provinceAddressModel){
    selectedProvinceModel.value = provinceAddressModel;
    selectedDistrictAddressModel.value = DistrictAddressModel();
    selectedWardAddressModel.value = WardAddressModel();
  }
  void selectedDistrict(DistrictAddressModel districtAddressModel){
    selectedDistrictAddressModel.value = districtAddressModel;
    selectedWardAddressModel.value = WardAddressModel();
  }
  void selectedWard(WardAddressModel wardAddressModel){
    selectedWardAddressModel.value = wardAddressModel;
  }

  Future<void> createAddress(BuildContext context) async{
    if(streetController.text.trim() != "" && selectedProvinceModel.value.sName != null && selectedDistrictAddressModel.value.sName != null && selectedWardAddressModel.value.sName != null){
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String,dynamic> params = {
        "token":token,
        "userId":userId,
        "street":streetController.text.trim(),
        "province": selectedProvinceModel.value.toJson(),
        "district":selectedDistrictAddressModel.value.toJson(),
        "ward": selectedWardAddressModel.value.toJson()
      };
      ResponseModel responseModel = await userRepository.apiAddAddress(param: params, token: token);
      if(responseModel.status) {
        SelectedAddressController addressController = Get.find();
        addressController.getUserInfo(context);
        Get.back();

      }else{
        CommonUtil.showToast(responseModel.message);
      }

    } else {
      CommonUtil.showToast("Bạn cần cung cấp đủ thông tin");
    }
  }

}
