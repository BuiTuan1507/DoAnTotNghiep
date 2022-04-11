import 'package:do_an/modules/post/page/post_page.dart';
import 'package:get/get.dart';

import '../controller/post_controller.dart';

class PostBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<PostPage>(() => PostPage());
  }
}
