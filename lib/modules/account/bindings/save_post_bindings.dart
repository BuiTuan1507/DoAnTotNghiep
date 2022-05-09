
import 'package:get/get.dart';

import '../../modules.dart';

class SavePostBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SavePostController>(() => SavePostController());
    Get.lazyPut<SavePostPage>(() =>  SavePostPage());
  }

}