import 'package:do_an/modules/account/controller/add_address_controller.dart';
import 'package:do_an/modules/account/page/add_address_page.dart';
import 'package:get/get.dart';

class AddAddressBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
    Get.lazyPut<AddAddressPage>(() =>  AddAddressPage());
  }

}