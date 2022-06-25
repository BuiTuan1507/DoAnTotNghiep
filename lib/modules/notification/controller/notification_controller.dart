import 'dart:developer';

import 'package:do_an/config/config.dart';
import 'package:do_an/models/chat/chat_room_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/models/post/list_notification_model.dart';
import 'package:do_an/modules/main/controller/main_controller.dart';
import 'package:do_an/modules/modules.dart';
import 'package:do_an/respository/chat_repository.dart';
import 'package:do_an/respository/notification_repository.dart';
import 'package:do_an/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/user/post_user_model.dart';
import '../../../service/share_prefencers/global_data.dart';

class NotificationController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isLoading = false.obs;

  NotificationRepository notificationRepository = NotificationRepository();

  RxList<ListNotification> activeNotification = <ListNotification>[].obs;

  RxList<ListNotification> notification = <ListNotification>[].obs;

  Rx<ListNotificationModel> listNotificationData = ListNotificationModel().obs;

  ChatRepository chatRepository = ChatRepository();

   Rx<ChatRoomModel> chatRoomModel = ChatRoomModel().obs;
  @override
  void onInit() async {
    await getListNotification();
    super.onInit();
  }

  Future<void> getListNotification() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "postId": 59
      };
      isLoading.value = true;
      ResponseModel responseModel = await notificationRepository
          .apiGetListNotification(param: params, token: token);
      if (responseModel.status) {
        listNotificationData.value =
            ListNotificationModel.fromJson(responseModel.data);
        if (listNotificationData.value.listNotification?.isNotEmpty == true) {
          listNotificationData.value.listNotification?.forEach((element) {
            if (element.typeNotification == 1 ||
                element.typeNotification == 2 ||
                element.typeNotification == 4) {
              notification.add(element);
            } else {
              activeNotification.add(element);
            }
          });
        }
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Có lỗi xảy ra khi lấy danh sách thông báo");
    }
  }

  Future<void> readingNotification(ListNotification listNotification) async {
    try {
      if(listNotification.isReading == true) return;
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "notificationId": listNotification.id
      };
      ResponseModel responseModel = await notificationRepository
          .readingNotification(param: params, token: token);
      if (responseModel.status) {
        listNotification.isReading = true;

        if (listNotification.typeNotification == 1 ||
            listNotification.typeNotification == 2 ||
            listNotification.typeNotification == 4) {

          int index = notification.indexOf(listNotification) ;
          if (index == -1) return;
          notification[index] = listNotification;
          notification.refresh();
        } else {
          int index = activeNotification.indexOf(listNotification) ;
          if (index == -1) return;
          activeNotification[index] = listNotification;
          activeNotification.refresh();
        }

        // update list
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast(e.toString());
    }
  }

  String getTittleNotification(ListNotification listNotification) {
    String tittle = "";
    switch (listNotification.typeNotification) {
      case 0:
        {
          tittle = (listNotification.name ?? "") + " vừa đăng tin";
        }
        break;
      case 1:
        {
          tittle = "";
        }
        break;
      case 2:
        {
          tittle = "";
        }
        break;

      case 3:
        {
          tittle = (listNotification.name ?? "") + " muốn mua sản phẩm ";
        }
        break;

      case 4:
        {
          tittle = "Đánh giá sản phẩm";
        }
        break;
      case 5:
        {
          tittle = (listNotification.name ?? "") + " đã từ chối bán cho bạn : ";
        }
        break;
    }
    return tittle;
  }

  String getContentPost(ListNotification listNotification) {
    String content = "";
    switch (listNotification.typeNotification) {
      case 0:
        {
          content = (listNotification.tittlePost ?? "");
        }
        break;
      case 1:
        {
          content = listNotification.tittlePost ?? "";
        }
        break;
      case 2:
        {
          content = listNotification.tittlePost ?? "";
        }
        break;

      case 3:
        {
          content = listNotification.tittlePost ?? "";
        }
        break;

      case 4:
        {
          content = listNotification.tittlePost ?? "";
        }
        break;
      case 5:
        {
          content = listNotification.tittlePost ?? "";
        }
        break;
    }
    return content;
  }

  Future<void> sellPost(ListNotification listNotification, bool isSell) async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> params = {
        "token": token,
        "userId": userId,
        "postId": listNotification.idPost,
        "buyUserId": listNotification.idUserCreate,
        "isSell" : isSell
      };
      ResponseModel responseModel =
          await notificationRepository.apiSellPost(param: params, token: token);

      if (responseModel.status) {
        CommonUtil.showToast("Đã bán đơn hàng thành công");

        bool test = Get.isRegistered<PostController>();

        if(test){
          PostController postController = Get.find();
          Posts posts = postController.activeListPost.firstWhere((element) => element.id == listNotification.idPost, orElse:() =>  Posts());
          postController.activeListPost.remove(posts);
          postController.activeListPost.refresh();
          postController.sellListPost.add(posts);
          postController.sellListPost.refresh();
        }else{

        }

      } else {
        CommonUtil.showToast(responseModel.message);
      }
      Get.back();
    } catch (e) {
      Get.back();
      CommonUtil.showToast("Lỗi khi bán bài đăng");
    }
  }

  Future<void> watchNotification(ListNotification listNotification, BuildContext context) async {


    switch (listNotification.typeNotification) {
      case 0:
        {
          Get.toNamed(RouterLink.productDetailPage, arguments:listNotification.idPost);
        }
        break;

      case 1:
        {

        }
        break;
      case 2:
        {
          bool test = Get.isRegistered<MainController>();
          if(test){
            MainController mainController = Get.find();
            mainController.currentIndex.value = 1;

            PostController postController = Get.find();
            postController.currentIndex.value = 2;
          }else{
            MainController mainController = Get.put(MainController());
            mainController.currentIndex.value = 1;

            PostController postController = Get.find();
            postController.currentIndex.value = 2;
          }
          Get.toNamed(RouterLink.main);
        }
        break;
      case 3:
        {
          if(listNotification.isReading == false){
            String tittle = getTittleNotification(listNotification);
            String content = getContentPost(listNotification);
            MyDialog.popUpAskBuy(context,chat: () { createChatRoom(listNotification); }, onCancel: () {
              sellPost(listNotification, false);
            }, onSubmit: () {
              sellPost(listNotification, true);
            }, nameUser: tittle ,namePost: content, tittle: "Thông báo");
          }
        }
        break;
      case 4:
      {
        if(listNotification.isReading == false){
          Get.toNamed(RouterLink.ratingPostPage, arguments: listNotification);
        }
      }
      break;
      case 5:
        {

        }
        break;

    }
    await readingNotification(listNotification);
  }

  Future<void> createChatRoom(ListNotification listNotification) async {
    try{
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "userChat" : listNotification.idUserCreate,
        "postId": listNotification.idPost,
      };

      ResponseModel responseModel = await chatRepository.apiAddChatRoom(param: param, token: token);

      if(responseModel.status){
        // to list room
       chatRoomModel.value = ChatRoomModel.fromJson(responseModel.data);
        Get.toNamed(RouterLink.chatDetailPage, arguments: chatRoomModel.value);
      }else{
        CommonUtil.showToast(responseModel.message);
      }
    }catch(e){
      log(e.toString());
      CommonUtil.showToast("Lỗi gửi thêm room chat");
    }
  }
}
