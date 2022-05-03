import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class AddPostCategoryBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<AddPostCategoryController>(() => AddPostCategoryController());
    Get.lazyPut<AddPostCategoryPage>(() => AddPostCategoryPage());
  }
}