

import 'dart:developer';

import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController{


  RxBool isLoading = false.obs;

  RxList<MainCategory> listMainCategory = <MainCategory>[].obs;

  PostRepository postRepository = PostRepository();

  @override
  void onInit() async {
    await getListMainCategory();
    super.onInit();
  }

  Future<void> getListMainCategory() async{
    try {
      listMainCategory.clear();
      isLoading.value = true;
      dynamic _listData = await postRepository.apiGetListMainCategory();
      for (var item in _listData) {
        listMainCategory.add(MainCategory.fromJson(item));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }
}