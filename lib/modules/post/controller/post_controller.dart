


import 'package:do_an/models/user/post_user_model.dart';
import 'package:do_an/respository/notification_repository.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../service/service.dart';
import '../../../utils/utils.dart';

class PostController extends GetxController{
  RxInt currentIndex = 0.obs;


  RxBool isLoading = false.obs;

  PostRepository postRepository = PostRepository();
  NotificationRepository notificationRepository = NotificationRepository();

  Rx<ListPostModel> listPostModel = ListPostModel().obs;

  RxList<Posts> cancelListPost = <Posts>[].obs;
  RxList<Posts> inExtendListPost = <Posts>[].obs;
  RxList<Posts> activeListPost = <Posts>[].obs;
  RxList<Posts> extendListPost = <Posts>[].obs;
  RxList<Posts> sellListPost = <Posts>[].obs;
  @override
  void onInit() async {
    await getListPostPersonal();
    super.onInit();
  }

  Future<void> getListPostPersonal() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    Map<String, dynamic> params = {
      "token": token,
      "userId": userId,
    };
    try{
      isLoading.value = true;
      ResponseModel responseModel = await postRepository.apiGetListPostPersonal(param: params, token: token);
      cancelListPost.clear();
      inExtendListPost.clear();
      activeListPost.clear();
      extendListPost.clear();
      sellListPost.clear();
      isLoading.value = false;
      if(responseModel.status){
        listPostModel.value = ListPostModel.fromJson(responseModel.data);
        if(listPostModel.value.posts?.isNotEmpty == true){
          listPostModel.value.posts?.forEach((element) {
            switch(element.state){
              case 0: {
                cancelListPost.add(element);
              }
              break;

              case 1: {
                inExtendListPost.add(element);
              }
              break;

              case 2: {
                activeListPost.add(element);
              }
              break;

              case 3: {
                extendListPost.add(element);
              }
              break;

              case 4: {
                sellListPost.add(element);
              }
              break;
            }
          });
        }
      }else{
        CommonUtil.showToast(responseModel.message);
      }

    }catch(e){
      isLoading.value = false;
      CommonUtil.showToast("Lấy bài đăng bị lỗi");
    }
  }
  Future<void> extendPost (int postId, BuildContext buildContext) async {
    try{
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String,dynamic> param = {
        "token": token,
        "userId": userId,
        "postId": postId
      };
      ResponseModel responseModel = await notificationRepository.apiExtendPost(param: param, token: token);
      if(responseModel.status){
        // update
        Posts posts = extendListPost.firstWhere((element) => element.id == postId, orElse:() =>  Posts());
        extendListPost.remove(posts);
        extendListPost.refresh();
        activeListPost.add(posts);
        activeListPost.refresh();

        Get.back();
        MyDialog.popUpSendMessageSuccess(buildContext, "Bài đăng đã được gia hạn thành công");

      }else{
        CommonUtil.showToast(responseModel.message);
      }
    }catch(e){
      CommonUtil.showToast("Lỗi khi gia  hạn bài đăng");
    }
    
  }
  Future<void> cancelPost(int postId, int statePost, BuildContext buildContext) async {
    try{
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String,dynamic> param = {
        "token": token,
        "userId": userId,
        "postId": postId
      };
      ResponseModel responseModel = await notificationRepository.apiCancelPost(param: param, token: token);
      if(responseModel.status){
        // update
        if(statePost == 2){
          Posts posts = activeListPost.firstWhere((element) => element.id == postId, orElse:() =>  Posts());
          activeListPost.remove(posts);
          activeListPost.refresh();
          cancelListPost.add(posts);
          cancelListPost.refresh();
        }else if(statePost == 3){
          Posts posts = extendListPost.firstWhere((element) => element.id == postId, orElse:() =>  Posts());
          extendListPost.remove(posts);
          extendListPost.refresh();
          cancelListPost.add(posts);
          cancelListPost.refresh();
        }
        Get.back();
        MyDialog.popUpSendMessageSuccess(buildContext, "Bạn đã huỷ bài đăng thành công");
      }else{
        CommonUtil.showToast(responseModel.message);
      }
    }catch(e){
      CommonUtil.showToast("Lỗi khi huỷ bài đăng");
    }
  }
}