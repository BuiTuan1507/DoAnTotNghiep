import 'dart:developer';

import 'package:do_an/respository/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_room_model.dart';

import '../../../models/response_model.dart';
import '../../../models/user/post_user_model.dart';
import '../../../service/service.dart';
import '../../../utils/common/common_util.dart';

class ChatController extends GetxController {
  RxInt currentIndex = 0.obs;

  final TextEditingController controller = TextEditingController();
  RxBool isLoading = false.obs;

  RxList<ChatRoomModel> listChatRoomModel = <ChatRoomModel>[].obs;

  ChatRepository chatRepository = ChatRepository();

  int page = 0;

  int pageSize = 6;

  bool isLoadMore = false;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    initScrollController();
    await getListRoomChat();

    super.onInit();
  }

  Future<void> getListRoomChat() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    if (page == 0) {
      listChatRoomModel.value = [];
    }
    try {
      isLoading.value = true;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "page": page,
        "size": pageSize,
        "sortBy": "id",
        "sortDir": "asc"
      };
      ResponseModel responseModel = await chatRepository.apiGetListChatRoom(
          param: param, token: token);
      if (responseModel.status) {

        dynamic _listData = responseModel.data;


        if (_listData.isEmpty == true) {
          isLoading.value = false;
          isLoadMore = false;
          return;
        }
        isLoadMore = true;

        for (var item in _listData) {
          listChatRoomModel.add(ChatRoomModel.fromJson(item));
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
      await getListRoomChat();
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
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}