import 'package:do_an/modules/product_detail/controller/watch_user_controller.dart';
import 'package:get/get.dart';

import '../page/watch_user_page.dart';

class WatchUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchUserController>(() => WatchUserController());
    Get.lazyPut<WatchUserPage>(() => WatchUserPage());
  }

}