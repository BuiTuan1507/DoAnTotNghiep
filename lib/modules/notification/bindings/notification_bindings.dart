import 'package:do_an/modules/modules.dart';
import 'package:get/get.dart';

class NotificationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<NotificationPage>(() => NotificationPage());
  }
  }

