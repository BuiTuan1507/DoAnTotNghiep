import 'package:get/get.dart';

import '../../modules.dart';

class NameRegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NameRegisterPage>(() => NameRegisterPage());
    Get.lazyPut<NameRegisterController>(() => NameRegisterController());
  }

}