import 'dart:developer';
import 'dart:io';

import 'package:do_an/models/chat/chat_room_model.dart';
import 'package:do_an/models/chat/detail_chat_room_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/respository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_users_model.dart';
import '../../../models/chat/message_model.dart';
import '../../../service/service.dart';
import '../../../utils/common/common_util.dart';

class ChatDetailController extends GetxController {
  RxList<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello, Will",
        messageType: "receiver",
        sendMessageStatus: false),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        sendMessageStatus: false),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        sendMessageStatus: false),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        sendMessageStatus: false),
    ChatMessage(
        messageContent: "Is there any thing wrong?",
        messageType: "sender",
        sendMessageStatus: false),
  ].obs;

  late ChatRoomModel chatRoomModel;

  final TextEditingController textEditingController = TextEditingController();

  List<File> fileImage = <File>[];

  Rx<DetailChatRoomModel> detailChatRoomModel = DetailChatRoomModel().obs;

  RxBool isLoading = false.obs;

  ChatRepository chatRepository = ChatRepository();

  RxList<MessageModel> listMessage = <MessageModel>[].obs;

  int page = 0;

  int pageSize = 6;

  bool isLoadMore = false;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    chatRoomModel = Get.arguments;
    await getDetailChatRoom();
    await getListMessage();
    super.onInit();
  }

  Future<void> getDetailChatRoom() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;

      isLoading.value = true;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "chatRoomId": chatRoomModel.id,
        "idUserCustomer": chatRoomModel.idCustomer
      };

      ResponseModel responseModel =
          await chatRepository.apiGetDetailChatRoom(param: param, token: token);

      if (responseModel.status) {
        detailChatRoomModel.value =
            DetailChatRoomModel.fromJson(responseModel.data);
      } else {
        isLoading.value = false;
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy thông tin room chat");
    }
  }
  Future<void> getListMessage() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    if (page == 0) {
      listMessage.value = [];
    }
    try {
      isLoading.value = true;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "chatRoomId":chatRoomModel.id,
        "page": page,
        "size": pageSize,
        "sortBy": "id",
        "sortDir": "asc"
      };
      ResponseModel responseModel =
      await chatRepository.apiGetListMessage(param: param, token: token);
      if (responseModel.status) {
        dynamic _listData = responseModel.data;

        if (_listData.isEmpty == true) {
          isLoading.value = false;
          isLoadMore = false;
          return;
        }
        isLoadMore = true;

        for (var item in _listData) {
          listMessage.add(MessageModel.fromJson(item));
        }

      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy room chat");
    }
  }

  Future<void> loadMorePost() async {
    if (isLoadMore) {
      page = page + 1;
      await getListMessage();
    }
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadMorePost();
    }
  }

  void initScrollController() {
    scrollController.addListener(_scrollListener);
  }
}
