import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class RegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<TermConditionRegisterPage>(() => TermConditionRegisterPage());

  }

}