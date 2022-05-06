import 'package:do_an/modules/account/controller/selected_address_controller.dart';
import 'package:do_an/modules/account/page/selected_address_page.dart';
import 'package:get/get.dart';

class SelectedAddressBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SelectedAddressPage>(() => SelectedAddressPage());
    Get.lazyPut<SelectedAddressController>(() =>  SelectedAddressController());
  }

}