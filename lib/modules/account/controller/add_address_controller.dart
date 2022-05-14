import 'dart:convert';
import 'dart:developer';

import 'package:do_an/respository/user_repository.dart';
import 'package:get/get.dart';

import '../../../models/user/address_model.dart';

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

  @override
  void onInit() async {
    // TODO: implement onInit
    await getListProvince();
    await getListDistrict();
    await getListWard();
    super.onInit();
  }

  Future<void> getListProvince() async {
    try {
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
    Map<String, dynamic> params = {"provinceId": 2};
    try {
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
    Map<String, dynamic> params = {"provinceId": 2, "districtId": 38};
    try {
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

  void selectedProvince(){

  }
}
