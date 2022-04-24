
import 'package:do_an/respository/login_repository.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class RootBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
