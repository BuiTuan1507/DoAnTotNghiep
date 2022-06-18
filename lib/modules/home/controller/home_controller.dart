import 'dart:developer';

import 'package:do_an/models/models.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../models/user/post_user_model.dart';
import '../../../service/service.dart';
import '../../../utils/utils.dart';

class HomeController extends GetxController {
  List<String> imageBanner = [
    MyImage.imageBanner,
    MyImage.imageBanner,
    MyImage.imageBanner,
    MyImage.imageBanner,
  ];

  List<IconFeature> listIcon = [
    IconFeature(
        icon: MyIcon.postSellIcon,
        name: "Đơn  mua",
        onClick: () {
          Get.toNamed(RouterLink.purchaseOrderPage);
        },
        color: Colors.green.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.postBuyIcon,
        name: "Đơn  bán",
        onClick: () {
          Get.toNamed(RouterLink.sellOrderPage);
        },
        color: Colors.blue.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.loveIcon,
        name: "Tin lưu",
        onClick: () {
          Get.toNamed(RouterLink.savePostPage);
        },
        color: Colors.red.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.friendsUser,
        name: "Bạn bè",
        onClick: () {
          Get.toNamed(RouterLink.friendUserPage);
        },
        color: Colors.amber.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.settingIcon,
        name: "Cài đặt",
        onClick: () {
          Get.toNamed(RouterLink.addAddressPage);
        },
        color: Colors.grey.withOpacity(0.4)),
  ];

  RxBool isLoading = false.obs;

  RxList<Posts> listPost = <Posts>[].obs;

  RxList<Posts> listPriorityPost = <Posts>[].obs;

  PostRepository postRepository = PostRepository();

  int page = 0;

  int pageSize = 6;

  bool isLoadMore = false;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    initScrollController();
    await getListPostNoFilter();

    super.onInit();
  }

  Future<void> getListPostNoFilter() async {
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    if (page == 0) {
      listPost.value = [];
      listPriorityPost.value = [];
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
      ResponseModel responseModel = await postRepository.apiGetListPostNoFilter(
          param: param, token: token);
      if (responseModel.status) {
        ListPostModel listPostModel =
            ListPostModel.fromJson(responseModel.data);
        if (listPostModel.posts?.isEmpty == true) {
          isLoading.value = false;
          isLoadMore = false;
          return;
        }
        isLoadMore = true;

        if (page == 0) {
          listPriorityPost.value = listPostModel.priorityPosts ?? <Posts>[];
        }

        listPost.addAll(listPostModel.posts ?? <Posts>[]);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      CommonUtil.showToast("Lỗi lấy bài đăng");
    }
  }

  Future<void> loadMorePost() async {
    if (isLoadMore) {
      page = page + 1;
      await getListPostNoFilter();
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

class IconFeature {
  String? icon;
  String? name;
  VoidCallback? onClick;
  Color? color;

  IconFeature({this.icon, this.name, this.onClick, this.color});
}
