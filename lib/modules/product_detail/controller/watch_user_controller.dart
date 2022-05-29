import 'dart:developer';

import 'package:do_an/models/post/another_user_info_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/post/detail_post_model.dart';
import '../../../models/response_model.dart';
import '../../../service/service.dart';
import '../../../utils/common/common_util.dart';

class WatchUserController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool isLoadingFollow = false.obs;

  Rx<UserPostData> userData = UserPostData().obs;

  Rx<AnotherUserInfoModel> fullUserData = AnotherUserInfoModel().obs;

  DetailPostRepository detailPostRepository = DetailPostRepository();

  Rx<String> joinTime = "".obs;
  Rx<String> rating = "Chưa đánh giá".obs;

  @override
  void onInit() async {
    if (Get.arguments != null) {
      userData.value = Get.arguments;
    }
    await getAnotherUserInfo();

    super.onInit();
  }

  void initData() {

    try {
      DateTime joinTimeDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(fullUserData.value.userInfo?.created ?? "");


      joinTime.value = DateFormat("dd-MM-yyyy").format(joinTimeDate);
    } catch (e) {
      log(e.toString());
    }

    if (fullUserData.value.userInfo?.rating != 0) {
      rating.value = (fullUserData.value.userInfo?.rating ?? 0).toString();
    }
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

      isLoadingFollow.value = true;

      ResponseModel responseModel =
          await detailPostRepository.apiFollowUser(param: param, token: token);

      if (responseModel.status) {
        if (fullUserData.value.userInfo?.follower == false) {

          int follow = fullUserData.value.userInfo?.followers ?? 0 ;

          AnotherUserInfoModel newUserData = AnotherUserInfoModel();
          newUserData.userInfo = fullUserData.value.userInfo?.copyWith(follower: true, followers: follow + 1);
          newUserData.postData = fullUserData.value.postData;
          fullUserData.value = newUserData;

          CommonUtil.showToast("Theo dõi" +
              (userData.value.firstName ?? "") +
              " " +
              (userData.value.lastName ?? "") +
              "thành công");
        } else {
          int follow = fullUserData.value.userInfo?.followers ?? 0 ;

          AnotherUserInfoModel newUserData = AnotherUserInfoModel();
          newUserData.userInfo = fullUserData.value.userInfo?.copyWith(follower: false, followers: follow - 1);
          newUserData.postData = fullUserData.value.postData;
          fullUserData.value = newUserData;
          CommonUtil.showToast("Bỏ theo dõi" +
              (userData.value.firstName ?? "") +
              " " +
              (userData.value.lastName ?? "") +
              "thành công");
        }
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoadingFollow.value = false;
    } catch (e) {
      isLoadingFollow.value = false;
      CommonUtil.showToast("Lỗi lấy theo dõi người dùng");
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
        initData();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy thông tin người dùng");
    }
  }
}
