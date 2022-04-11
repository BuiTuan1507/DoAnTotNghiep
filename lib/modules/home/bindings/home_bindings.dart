import 'package:do_an/modules/home/controller/home_controller.dart';
import 'package:do_an/modules/home/home_page.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<HomeController>(() => HomeController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<HomePage>(() => HomePage());
  }

}