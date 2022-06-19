import 'package:do_an/modules/login/controller/forget_password_controller.dart';
import 'package:do_an/modules/login/page/forget_password_page.dart';
import 'package:get/get.dart';

class ForgetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
    Get.lazyPut<ForgetPasswordPage>(() => ForgetPasswordPage());
  }
}