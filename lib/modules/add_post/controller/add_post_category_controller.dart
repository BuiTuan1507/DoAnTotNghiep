import 'package:do_an/models/category/category_model.dart';
import 'package:get/get.dart';

class AddPostCategoryController extends GetxController {
   Rx<CategoryModel> categoryModel = CategoryModel().obs ;
  @override
  void onInit() {
    if(Get.arguments != null) {
      categoryModel.value = Get.arguments;
    }
    super.onInit();
  }
}