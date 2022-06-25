import 'dart:io';

import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/models/user/post_user_model.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/service.dart';
import '../../../utils/utils.dart';

class ListCategoryPostController extends GetxController {
  Rx<SubCategory> selectedCategory = SubCategory().obs;

  Rx<String> selectedMainCategoryName = "Chưa chọn".obs;

  late int idMainCategory;
  late String nameCategory;

  PostRepository postRepository = PostRepository();
  RxBool isLoading = false.obs;

  Rx<ListPostModel> listPostFilter = ListPostModel().obs;

  RxList<Posts> listPosts = <Posts>[].obs;

  int page = 0;

  int pageSize = Constants.sizePage;

  bool isLoadMore = false;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    initScrollController();
    if (Get.arguments != null) {
      idMainCategory = Get.arguments['idMainCategory'];
      nameCategory = Get.arguments['nameCategory'];
    }
    await getListPostMainCategory();
    super.onInit();
  }

  Future<void> filterPost(Map<String, dynamic> param, String token) async {
    try {
      isLoading.value = true;

      ResponseModel responseModel =
          await postRepository.apiGetListPostFilter(param: param, token: token);

      if (responseModel.status) {
        listPostFilter.value = ListPostModel.fromJson(responseModel.data);
        if (listPostFilter.value.posts?.isEmpty == true && listPostFilter.value.posts?.isEmpty == true) {
          isLoading.value = false;
          isLoadMore = false;
          return;
        }
        isLoadMore = true;

        listPosts.addAll(listPostFilter.value.priorityPosts ?? []);
        listPosts.addAll(listPostFilter.value.posts ?? []);
        listPosts.refresh();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Có lỗi xảy ra");
    }
  }

  Future<void> getListPostMainCategory() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    if (page == 0) {
      listPosts.value = [];
    }
    Map<String, dynamic> param = {
      "token": token,
      "userId": userId,
      "page": page,
      "size": pageSize,
      "sortBy": "id",
      "sortDir": "asc",
      "id_main_category": idMainCategory,
      "subCategory": -1,
      "formUse": "",
      "conditionUse": "",
      "startMoney": 0,
      "endMoney": 0
    };
    await filterPost(param, token);
  }

  Future<void> getListPostSubCategory() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    if (page == 0) {
      listPosts.value = [];
    }
    Map<String, dynamic> param = {
      "token": token,
      "userId": userId,
      "page": page,
      "size": pageSize,
      "sortBy": "id",
      "sortDir": "asc",
      "id_main_category": idMainCategory,
      "subCategory": selectedCategory.value.id,
      "formUse": "",
      "conditionUse": "",
      "startMoney": 0,
      "endMoney": 0
    };
    await filterPost(param, token);
  }


  Future<void> loadMorePost() async {
    if (isLoadMore) {
      page = page + 1;
      if(selectedCategory.value.sName != null){
        await getListPostSubCategory();
      }else{
        await getListPostMainCategory();
      }
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
