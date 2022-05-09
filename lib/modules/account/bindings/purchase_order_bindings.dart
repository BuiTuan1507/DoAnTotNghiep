import 'package:do_an/modules/account/controller/purchase_order_controller.dart';
import 'package:do_an/modules/account/page/purchase_order_page.dart';
import 'package:get/get.dart';

class PurchaseOrderBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PurchaseOrderController>(() => PurchaseOrderController());
    Get.lazyPut<PurchaseOrderPage>(() =>  PurchaseOrderPage());
  }

}