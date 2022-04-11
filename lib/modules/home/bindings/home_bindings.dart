
import 'package:get/get.dart';

import '../../modules.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<HomeController>(() => HomeController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<HomePage>(() => HomePage());
  }

}