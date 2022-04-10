
import 'package:do_an/respository/login_repository.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../page/login_page.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<LoginPage>(() => LoginPage());
  }
}
