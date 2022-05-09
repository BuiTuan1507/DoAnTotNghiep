import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class InfoAccountRegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoAccountRegisterPage>(() => InfoAccountRegisterPage());
    Get.lazyPut<InfoAccountRegisterController>(() => InfoAccountRegisterController());
  }

}