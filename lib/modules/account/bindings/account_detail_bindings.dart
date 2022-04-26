import 'package:get/get.dart';

import '../../modules.dart';

class AccountDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailController>(() => AccountDetailController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<AccountDetailPage>(() =>  AccountDetailPage());
  }

}