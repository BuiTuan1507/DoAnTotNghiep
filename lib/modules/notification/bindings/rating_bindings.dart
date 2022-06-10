import 'package:get/get.dart';

import '../controller/rating_post_controller.dart';
import '../page/rating_post_page.dart';

class RatingBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RatingPostController>(() => RatingPostController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<RatingPostPage>(() => RatingPostPage());
  }
}