import 'dart:developer';

import 'package:do_an/models/response_model.dart';
import 'package:do_an/models/user/setting_user_model.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:get/get.dart';

import '../../../service/share_prefencers/global_data.dart';
import '../../../utils/common/common_util.dart';

class MainController extends GetxController{
  RxInt currentIndex = 0.obs;

  Rx<SettingUserModel> settingUserModel = SettingUserModel().obs;

  PostRepository postRepository = PostRepository();

  @override
  void onInit() async {
    await getSettingUser();
    super.onInit();
  }

  Future<void> getSettingUser () async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    try {
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "searchText": ""
      };
      ResponseModel responseModel = await postRepository.getSettingInfo(
          param: param, token: token);
      if (responseModel.status) {
        settingUserModel.value =
        SettingUserModel.fromJson(responseModel.data);

      }else{
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy thông tin người dùng");
    }
  }
}