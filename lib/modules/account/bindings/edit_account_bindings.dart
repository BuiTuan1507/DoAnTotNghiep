import 'package:get/get.dart';

import '../../modules.dart';

class EditAccountDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditAccountPage>(() => EditAccountPage());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<EditAccountController>(() =>  EditAccountController());
  }

}