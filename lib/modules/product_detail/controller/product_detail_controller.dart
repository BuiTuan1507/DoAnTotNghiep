import 'dart:developer';

import 'package:do_an/models/models.dart';
import 'package:do_an/models/user/post_user_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:do_an/respository/notification_repository.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/post/detail_post_model.dart';
import '../../../service/service.dart';

class ProductDetailController extends GetxController {

  Rx<Posts> post = Posts().obs;

  RxList<String> listImage = <String>[].obs;

  Rx<String> dateJoin = " ".obs;

  RxBool isLoading = false.obs;

  DetailPostRepository detailPostRepository = DetailPostRepository();

  PostRepository postRepository = PostRepository();

  Rx<DetailPostModel> detailPostModel = DetailPostModel().obs;

  Rx<ListPostModel> listPostFilter = ListPostModel().obs;

  RxList<Posts> listPosts = <Posts>[].obs;

  NotificationRepository notificationRepository = NotificationRepository();

  @override
  void onInit() async {
    if (Get.arguments != null) {
      post.value = Get.arguments;
    }
    await getProductDetail();
    await getListPostMainCategory();
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
    try{
      DateTime joinTimeDate = DateFormat("yyyy-MM-dd hh:mm:ss")
          .parse(detailPostModel.value.userPostData?.created ?? "");

      dateJoin.value = DateFormat("dd-MM-yyyy").format(joinTimeDate);
    }catch(e){
      log(e.toString());
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
        int like = detailPostModel.value.post?.liked ?? 0 ;
        DetailPostModel newDetailPostModel = DetailPostModel();
        newDetailPostModel.post = detailPostModel.value.post?.copyWith(isLike: true, liked: like + 1);
        newDetailPostModel.userPostData = detailPostModel.value.userPostData;
        detailPostModel.value = newDetailPostModel;
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
        int like = detailPostModel.value.post?.liked ?? 0 ;
        DetailPostModel newDetailPostModel = DetailPostModel();
        newDetailPostModel.post = detailPostModel.value.post?.copyWith(isLike: false, liked: like -1 );
        newDetailPostModel.userPostData = detailPostModel.value.userPostData;
        detailPostModel.value = newDetailPostModel;
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Lỗi lấy thông tin bài đăng");
    }
  }

  Future<void> filterPost(Map<String, dynamic> param, String token)async {
    try{
      listPosts.clear();
      isLoading.value = true;

      ResponseModel responseModel = await postRepository.apiGetListPostFilter(param: param, token: token);

      if(responseModel.status){

        listPostFilter.value = ListPostModel.fromJson(responseModel.data);
        listPosts.addAll(listPostFilter.value.priorityPosts ?? []);
        listPosts.addAll(listPostFilter.value.posts ?? []);
        listPosts.refresh();
      }else{
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;

    }catch(e){
      isLoading.value = false;
      CommonUtil.showToast("Có lỗi xảy ra");
    }
  }
  Future<void> getListPostMainCategory() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    Map<String, dynamic> param = {
      "token": token,
      "userId": userId,
      "id_main_category": post.value.idMainCategory,
      "subCategory": post.value.idSubCategory,
      "formUse":"",
      "conditionUse":"",
      "startMoney":0,
      "endMoney":0
    };
    await filterPost(param, token);
  }

  Future<void> buyPost() async {
   try{
     String token = GlobalData.getUserModel().token ?? "";
     int userId = GlobalData.getUserModel().id ?? 0;
     Map<String, dynamic> param = {
       "token": token,
       "userId": userId,
       "postId" : detailPostModel.value.post?.id
     };
     ResponseModel responseModel = await notificationRepository.apiBuyPost(param: param, token: token);
     if(responseModel.status){
       CommonUtil.showToast("Bạn đã gửi thông báo mua thành công");
     }else{
       CommonUtil.showToast(responseModel.message);
     }
   }catch(e){
     CommonUtil.showToast("Lỗi gửi thông báo mua sản phẩm");
   }
  }

}
