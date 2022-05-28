import 'package:do_an/models/models.dart';
import 'package:do_an/models/user/post_user_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:get/get.dart';

import '../../../models/post/detail_post_model.dart';
import '../../../service/service.dart';
import '../../../utils/constants/app_image.dart';

class ProductDetailController extends GetxController {

  Rx<Posts> post = Posts().obs;

  RxList<String> listImage = <String>[].obs;

  RxBool isLoading = false.obs;

  DetailPostRepository detailPostRepository = DetailPostRepository();

  Rx<DetailPostModel> detailPostModel = DetailPostModel().obs;

  @override
  void onInit() async {
    if (Get.arguments != null) {
      post.value = Get.arguments;
    }
    await getProductDetail();
    super.onInit();
  }

  Future<void> getProductDetail() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "idPost": post.value.id
      };
      isLoading.value = true;
      ResponseModel responseModel = await detailPostRepository.apiGetDetailPost(
          param: param, token: token);
      if (responseModel.status) {
        detailPostModel.value = DetailPostModel.fromJson(responseModel.data);
        initData();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Lỗi lấy thông tin bài đăng");
    }
  }

  void initData() {
    if(detailPostModel.value.post?.media?.isNotEmpty == true){
      for(var media in detailPostModel.value.post!.media!){
        listImage.add(media.fileDownloadUri ?? "");
      }
    }
  }

  Future<void> likePost() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "idPost": post.value.id
      };
      ResponseModel responseModel = await detailPostRepository.apiLikePost(
          param: param, token: token);
      if (responseModel.status) {
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Thích bài đăng thất bại");
    }
  }
  Future<void> unLikePost() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "idPost": post.value.id
      };
      ResponseModel responseModel = await detailPostRepository.apiUnLikePost(
          param: param, token: token);
      if (responseModel.status) {
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Lỗi lấy thông tin bài đăng");
    }
  }
}
