import 'package:do_an/modules/add_post/controller/add_post_info_controller.dart';
import 'package:do_an/modules/add_post/page/add_post_info_page.dart';
import 'package:get/get.dart';

class AddPostInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostInfoController>(() => AddPostInfoController());
    Get.lazyPut<AddPostInfoPage>(() => AddPostInfoPage());
  }
}