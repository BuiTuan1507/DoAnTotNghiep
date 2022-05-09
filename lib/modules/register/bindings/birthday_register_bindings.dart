import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class BirthdayRegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BirthDayRegisterPage>(() => BirthDayRegisterPage());
    Get.lazyPut<BirthdayRegisterController>(() => BirthdayRegisterController());
  }

}