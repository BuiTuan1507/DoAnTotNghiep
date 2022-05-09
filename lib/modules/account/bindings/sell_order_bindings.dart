import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class SellOrderBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SellOrderController>(() => SellOrderController());
    Get.lazyPut<SellOrderPage>(() =>  SellOrderPage());
  }

}