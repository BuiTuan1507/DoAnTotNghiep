
import 'package:get/get.dart';

import '../../modules.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<MainController>(() => MainController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<MainPage>(() => MainPage());
  }

}