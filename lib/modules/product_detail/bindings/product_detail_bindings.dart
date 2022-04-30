import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class ProductDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());

    Get.lazyPut<ProductDetailPage>(() => ProductDetailPage());
  }

}