import 'dart:developer';

import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/respository/post_repository.dart';
import 'package:get/get.dart';

class AddPostCategoryController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<SubCategory> listSubCategory = <SubCategory>[].obs;

  Rx<MainCategory> mainCategory = MainCategory().obs;

  PostRepository postRepository = PostRepository();

  @override
  void onInit() async {
    if(Get.arguments != null){
      mainCategory.value = Get.arguments;
    }
    await getListSubCategory();
    super.onInit();
  }

  Future<void> getListSubCategory() async{
    Map<String,dynamic> param = {
      "mainId":mainCategory.value.id
    };
    try {
      listSubCategory.clear();
      isLoading.value = true;

      dynamic _listData = await postRepository.apiGetListSubCategory(param: param);

      for (var item in _listData) {
        listSubCategory.add(SubCategory.fromJson(item));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }
}