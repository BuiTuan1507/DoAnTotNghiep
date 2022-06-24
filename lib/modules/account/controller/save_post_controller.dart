import 'package:do_an/models/post/post_user_like_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:get/get.dart';

import '../../../models/response_model.dart';
import '../../../respository/post_repository.dart';
import '../../../service/share_prefencers/global_data.dart';
import '../../../utils/common/common_util.dart';

class SavePostController extends GetxController{
  RxBool isLoading = false.obs;

  RxList<PostUserLikeModel> listPostUserData = <PostUserLikeModel>[].obs;

  PostRepository postRepository = PostRepository();

  DetailPostRepository detailPostRepository = DetailPostRepository();


  @override
  void onInit() async {
    await getListPostBuy();
    super.onInit();
  }

  Future<void> getListPostBuy () async {
    try{
      isLoading.value = true;
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId
      };
      ResponseModel responseModel = await postRepository.getListPostSell(param: param, token: token);
      if(responseModel.status){
        dynamic data = responseModel.data;
        if(data.length > 0){
          for(var item in data){
            listPostUserData.add(PostUserLikeModel.fromJson(item));
          }
        }

      }else{
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;

    }
    catch(e){
      isLoading.value = false;

      CommonUtil.showToast("Lỗi lấy danh sách tin đã mua");
    }
  }

  Future<void> likePost(PostUserLikeModel post) async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "idPost": post.id
      };
      ResponseModel responseModel = await detailPostRepository.apiLikePost(
          param: param, token: token);
      if (responseModel.status) {
        int index = listPostUserData.indexOf(post);
        if(index == -1) return;
        listPostUserData[index] = post.copyWith(isLike: true);
        listPostUserData.refresh();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Thích bài đăng thất bại");
    }
  }
  Future<void> unLikePost(PostUserLikeModel post) async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "idPost": post.id
      };
      ResponseModel responseModel = await detailPostRepository.apiUnLikePost(
          param: param, token: token);
      if (responseModel.status) {
        int index = listPostUserData.indexOf(post);
        if(index == -1) return;
        listPostUserData[index] = post.copyWith(isLike: false);
        listPostUserData.refresh();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Lỗi lấy thông tin bài đăng");
    }
  }
}