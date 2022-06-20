import 'package:do_an/modules/login/controller/reset_password_controller.dart';
import 'package:do_an/modules/login/page/reset_password_page.dart';
import 'package:get/get.dart';

class ResetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
    Get.lazyPut<ResetPasswordPage>(() => ResetPasswordPage());
  }

}