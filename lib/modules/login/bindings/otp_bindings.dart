import 'package:do_an/modules/login/controller/otp_controller.dart';
import 'package:do_an/modules/login/page/otp_page.dart';
import 'package:get/get.dart';

class OTPBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
    Get.lazyPut<OTPPage>(() => OTPPage());
  }
}