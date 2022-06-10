import 'package:do_an/models/models.dart';
import 'package:do_an/models/post/list_notification_model.dart';
import 'package:do_an/respository/notification_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../service/share_prefencers/global_data.dart';

class RatingPostController extends GetxController {
  RxDouble ratingPost = 0.0.obs;

  final TextEditingController textEditingController = TextEditingController(text: "");

  Rx<ListNotification> notification = ListNotification().obs;

  NotificationRepository notificationRepository = NotificationRepository();
  @override
  void onInit() {
    if(Get.arguments != null){
      notification.value = Get.arguments;
    }
    super.onInit();
  }

  Future<void> sendRating () async {
    if(ratingPost.value == 0.0){
      CommonUtil.showToast("Bạn phải đánh giá sao thì mới được gửi");
      return;
    }
    try{
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "postId": notification.value.idPost,
        "rating": ratingPost.value,
        "ratingText": textEditingController.text.trim()
      };
      ResponseModel responseModel = await notificationRepository.apiRatingPost(param: params, token: token);
      if(responseModel.status){
        CommonUtil.showToast("Đánh giá thành công, cám ơn bạn", isSuccessToast: true);
        Get.back();
      }else{
        CommonUtil.showToast(responseModel.message);
        Get.back();
      }
    }catch(e){
      CommonUtil.showToast(e.toString());
      Get.back();
    }
  }
}