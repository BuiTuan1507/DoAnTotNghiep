import 'package:get/get.dart';

import '../../modules.dart';

class AddPostBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<AddPostController>(() => AddPostController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<AddPostPage>(() => AddPostPage());
  }

}