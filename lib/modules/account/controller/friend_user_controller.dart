import 'package:do_an/models/models.dart';
import 'package:do_an/models/post/list_friends_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:get/get.dart';

import '../../../service/share_prefencers/global_data.dart';

class FriendUserController extends GetxController{
  RxBool isLoading = false.obs;

  Rx<ListFriendsModel> listFriends = ListFriendsModel().obs;

  DetailPostRepository detailPostRepository = DetailPostRepository();

  RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    await getListFriends();
    super.onInit();
  }

  Future<void> getListFriends () async {
    try{
      isLoading.value = true;
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId
      };
      ResponseModel responseModel = await detailPostRepository.apiGetListFriends(param: param, token: token);
      if(responseModel.status){
        listFriends.value = ListFriendsModel.fromJson(responseModel.data);
      }else{
        CommonUtil.showToast(responseModel.message);
      }
    }
    catch(e){
      CommonUtil.showToast("Lỗi lấy danh sách bạn bè");
    }
  }

  Future<void> followUser(Follower follower) async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {};

      param = {
        "token": token,
        "userId": userId,
        "followUserId": follower.id,
        "stateRequest": false
      };


      ResponseModel responseModel =
      await detailPostRepository.apiFollowUser(param: param, token: token);

      if (responseModel.status) {

        ListFriendsModel newListFriends = ListFriendsModel();
        listFriends.value.follower?.remove(follower);
        listFriends.refresh();
     //   newListFriends.follower = listFriends.value.follower;

     //   newUserData.postData = fullUserData.value.postData;
     //   fullUserData.value = newUserData;

        CommonUtil.showToast("Bỏ theo dõi " +
            (follower.firstName ?? "") +
            " " +
            (follower.lastName ?? "") +
            " thành công");
      } else {
        CommonUtil.showToast(responseModel.message);
      }
   //   isLoadingFollow.value = false;
    } catch (e) {
   //   isLoadingFollow.value = false;
      CommonUtil.showToast("Lỗi lấy theo dõi người dùng");
    }
  }
}