import 'dart:async';
import 'dart:developer';

import 'package:do_an/models/models.dart';
import 'package:do_an/models/post/history_search_model.dart';
import 'package:do_an/models/user/post_user_model.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../service/service.dart';

class SearchController extends GetxController {
  RxString keyword = "".obs;

  RxString currentKeyword = ".".obs;

  RxBool isLoading = false.obs;

  final TextEditingController searchController = TextEditingController();

  PostRepository postRepository = PostRepository();

  List<String> text = ['a', "b", "c", "d"];

  Rx<ListPostModel> listPostSearch = ListPostModel().obs;
  RxList<Posts> listPosts = <Posts>[].obs;

  Rx<HistorySearch> historySearch = HistorySearch().obs;

  Timer? _debounce;

  RxBool isFirstSearch = false.obs;

  @override
  void onInit() async {
    await getListHistorySearch();
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  Future<void> getListSearchPost() async {
    listPosts.clear();
    FocusManager.instance.primaryFocus?.unfocus();

    if (keyword.value == "") {
      listPostSearch.value = ListPostModel();
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
          await postRepository.apiSearchPost(param: param, token: token);

      currentKeyword.value = keyword.value;

      if (responseModel.status) {
        listPostSearch.value = ListPostModel.fromJson(responseModel.data);
        listPosts.addAll(listPostSearch.value.priorityPosts ?? []);
        listPosts.addAll(listPostSearch.value.posts ?? []);
        listPosts.refresh();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Lỗi tìm kiếm");
    }
  }

  Future<void> searchPost(String text) async {
    keyword.value = searchController.text.trim();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      getListSearchPost();
    });
  }

  Future<void> getListHistorySearch() async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {"token": token, "userId": userId};

      ResponseModel responseModel = await postRepository
          .apiGetListHistorySearch(param: param, token: token);

      if (responseModel.status) {
        historySearch.value = HistorySearch.fromJson(responseModel.data);
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Lỗi khi lấy lịch sử");
    }
  }

  void setListHistorySearch() {
    if (historySearch.value.listSearch?.isNotEmpty == true) {
      historySearch.value.listSearch?.forEach((element) {
        element.isSelected = !element.isSelected!;
      });
      historySearch.refresh();
    }
  }

  Future<void> deleteHistorySearch(ListSearch listSearch) async {
    try {
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "historySearchId": listSearch.id
      };
      ResponseModel responseModel =
          await postRepository.deleteHistorySearch(param: param, token: token);
      if (responseModel.status) {
        historySearch.value.listSearch?.remove(listSearch);
        historySearch.refresh();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast("Lỗi khi xoá lịch sử");
    }
    setListHistorySearch();
  }

  void sortMoneyListPost() {
    listPosts.sort((a, b) => (a.money ?? 0).compareTo(b.money ?? 1));
    listPosts.value = listPosts.reversed.toList();
    listPosts.refresh();
  }

  void sortTimeListPost() {
    try {
      listPosts.sort((a, b) =>
          (DateFormat("yyyy-MM-dd HH:mm:ss").parse(a.createTime ?? ""))
              .compareTo(
                  DateFormat("yyyy-MM-dd HH:mm:ss").parse(b.createTime ?? "")));
      listPosts.value = listPosts.reversed.toList();
      listPosts.refresh();
    } catch (e) {
      log(e.toString());
      CommonUtil.showToast("Lỗi khi sắp xếp danh sách");
    }
  }
}
