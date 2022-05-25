import 'package:do_an/modules/list_category/controller/list_category_post_controller.dart';
import 'package:do_an/modules/list_category/page/list_category_post_page.dart';
import 'package:get/get.dart';

class ListCategoryPostBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ListCategoryPostController>(() => ListCategoryPostController());
    Get.lazyPut<ListCategoryPostPage>(() => ListCategoryPostPage());
  }

}