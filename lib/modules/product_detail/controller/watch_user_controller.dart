import 'package:do_an/models/post/another_user_info_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:get/get.dart';

import '../../../models/post/detail_post_model.dart';
import '../../../models/response_model.dart';
import '../../../service/service.dart';
import '../../../utils/common/common_util.dart';

class WatchUserController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<UserPostData> userData = UserPostData().obs;

  Rx<AnotherUserInfoModel> fullUserData = AnotherUserInfoModel().obs;

  DetailPostRepository detailPostRepository = DetailPostRepository();

  @override
  void onInit() async {
    if (Get.arguments != null) {
      userData = Get.arguments;
    }
    await getAnotherUserInfo();
    super.onInit();
  }

  Future<void> followUser() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {};
      if (fullUserData.value.userInfo?.follower == false) {
        param = {
          "token": token,
          "userId": userId,
          "followUserId": userData.value.id,
          "stateRequest": true
        };
      } else {
        param = {
          "token": token,
          "userId": userId,
          "followUserId": userData.value.id,
          "stateRequest": false
        };
      }

      isLoading.value = true;

      ResponseModel responseModel =
          await detailPostRepository.apiFollowUser(param: param, token: token);

      if (responseModel.status) {
        if (fullUserData.value.userInfo?.follower == false) {
          fullUserData.value.userInfo?.follower = true;
          CommonUtil.showToast("Theo dõi" +
              (userData.value.firstName ?? "") +
              " " +
              (userData.value.lastName ?? "") +
              "thành công");
        } else {
          fullUserData.value.userInfo?.follower = false;
          CommonUtil.showToast("Bỏ theo dõi" +
              (userData.value.firstName ?? "") +
              " " +
              (userData.value.lastName ?? "") +
              "thành công");
        }
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Lỗi lấy thông tin bài đăng");
    }
  }

  Future<void> getAnotherUserInfo() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "followUserId": userData.value.id,
        "stateRequest": true
      };
      isLoading.value = true;

      ResponseModel responseModel = await detailPostRepository
          .apiGetAnotherUserInfo(param: param, token: token);

      if (responseModel.status) {
        fullUserData.value = AnotherUserInfoModel.fromJson(responseModel.data);
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Lỗi lấy thông tin người dùng");
    }
  }
}
