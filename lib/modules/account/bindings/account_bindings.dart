
import 'package:get/get.dart';

import '../../modules.dart';

class AccountBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<AccountPage>(() => const AccountPage());
  }

}