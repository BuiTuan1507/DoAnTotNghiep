import 'dart:async';
import 'dart:developer';

import 'package:do_an/respository/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_room_model.dart';

import '../../../models/response_model.dart';
import '../../../service/service.dart';
import '../../../utils/utils.dart';

class ChatController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isLoading = false.obs;

  RxList<ChatRoomModel> listChatRoomModel = <ChatRoomModel>[].obs;

  RxList<ChatRoomModel> sellChat = <ChatRoomModel>[].obs;

  RxList<ChatRoomModel> buyChat = <ChatRoomModel>[].obs;

  ChatRepository chatRepository = ChatRepository();

  int page = 0;

  int pageSize = Constants.sizePage;

  bool isLoadMore = false;

  ScrollController scrollController = ScrollController();

  RxString keyword = "".obs;

  RxString currentKeyword = ".".obs;

  final TextEditingController searchController = TextEditingController();

  Timer? _debounce;

  RxBool isFirstSearch = false.obs;

  @override
  void onInit() async {
    initScrollController();
    await getListRoomChat();

    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
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
      ResponseModel responseModel =
          await chatRepository.apiGetListChatRoom(param: param, token: token);
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
        if (listChatRoomModel.isNotEmpty) {
          for (ChatRoomModel chatRoom in listChatRoomModel) {
            if (chatRoom.isUserAddPost ?? true) {
              sellChat.add(chatRoom);
            } else {
              buyChat.add(chatRoom);
            }
          }
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

  Future<void> getListSearchPost() async {
    listChatRoomModel.clear();
    sellChat.clear();
    buyChat.clear();
    FocusManager.instance.primaryFocus?.unfocus();

    if (keyword.value == "") {
      page = 0;
      await getListRoomChat();
      return;
    }
    if (currentKeyword.value == keyword.value) {
      return;
    }

    try {
      isLoading.value = true;
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "searchText": keyword.value
      };
      isFirstSearch.value = true;

      ResponseModel responseModel =
          await chatRepository.apiSearchChatRoom(param: param, token: token);

      currentKeyword.value = keyword.value;

      if (responseModel.status) {
        dynamic _listData = responseModel.data;

        for (var item in _listData) {
          listChatRoomModel.add(ChatRoomModel.fromJson(item));
        }

        if (listChatRoomModel.isNotEmpty) {
          for (ChatRoomModel chatRoom in listChatRoomModel) {
            if (chatRoom.isUserAddPost ?? true) {
              sellChat.add(chatRoom);
            } else {
              buyChat.add(chatRoom);
            }
          }
        }
        listChatRoomModel.refresh();
        sellChat.refresh();
        buyChat.refresh();

      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Lỗi tìm kiếm");
    }
  }


  Future<void> searchPost() async {
    keyword.value = searchController.text.trim();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      getListSearchPost();
    });
  }
}
