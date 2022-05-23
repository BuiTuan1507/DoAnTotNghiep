import 'package:do_an/models/models.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        onClick: () {},
        color: Colors.green.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.postBuyIcon,
        name: "Đơn  bán",
        onClick: () {},
        color: Colors.blue.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.loveIcon,
        name: "Tin lưu",
        onClick: () {},
        color: Colors.red.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.friendsUser,
        name: "Bạn bè",
        onClick: () {},
        color: Colors.amber.withOpacity(0.4)),
    IconFeature(
        icon: MyIcon.settingIcon,
        name: "Cài đặt",
        onClick: () {},
        color: Colors.grey.withOpacity(0.4)),
  ];

  RxBool isLoading = false.obs;

  RxList<Posts> listPost = <Posts>[].obs;

  RxList<Posts> listPriorityPost = <Posts>[].obs;

  PostRepository postRepository = PostRepository();

  int page = 0;

  int pageSize = 3;

  bool isLoadMore = false;

  @override
  void onInit() async {
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
          isLoadMore = false;
          return;
        }
        isLoadMore = true;

        if (page == 0) {
          listPriorityPost.value = listPostModel.priorityPosts ?? <Posts>[];
        }

        listPost.addAll(listPostModel.priorityPosts ?? <Posts>[]);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CommonUtil.showToast("Lỗi lấy bài đăng");
    }
  }

  Future<void> loadMorePost() async {
    if (isLoadMore) {
      page = page + 1;
      await getListPostNoFilter();
    }
  }
}

class IconFeature {
  String? icon;
  String? name;
  VoidCallback? onClick;
  Color? color;

  IconFeature({this.icon, this.name, this.onClick, this.color});
}
