import 'package:do_an/models/models.dart';
import 'package:do_an/models/post/list_notification_model.dart';
import 'package:do_an/respository/notification_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../service/share_prefencers/global_data.dart';

class NotificationController extends GetxController{
  RxInt currentIndex = 0.obs;
  
  RxBool isLoading = false.obs;

  NotificationRepository notificationRepository = NotificationRepository();

  Rx<ListNotificationModel> listNotificationData = ListNotificationModel().obs;
  @override
  void onInit() async {
    await getListNotification();
    super.onInit();
  }
  
  Future<void> getListNotification () async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "postId":59
      };
      isLoading.value = true;
      ResponseModel responseModel = await notificationRepository.apiGetListNotification(param: params, token: token);
      if(responseModel.status){
        listNotificationData.value = ListNotificationModel.fromJson(responseModel.data);
      }else{
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    }catch(e) {
      isLoading.value = false;
      CommonUtil.showToast("Có lỗi xảy ra khi lấy danh sách thông báo");
    }
  }
  Future<void> readingNotification (ListNotification listNotification) async {
    try{
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "notificationId": listNotification.id
      };
      ResponseModel responseModel = await notificationRepository.readingNotification(param: params, token: token);
      if(responseModel.status){
        listNotification.isReading = true;
        int index = listNotificationData.value.listNotification?.indexOf(listNotification) ?? 0;
        if(index == -1) return ;
        listNotificationData.value.listNotification?[index] = listNotification;
        listNotificationData.refresh();
        // update list
      }else{
        CommonUtil.showToast(responseModel.message);
      }
    }catch(e) {
      CommonUtil.showToast(e.toString());
    }
  }


}