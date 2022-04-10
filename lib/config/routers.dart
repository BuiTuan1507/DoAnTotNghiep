import 'package:do_an/config/routes_link.dart';

import 'package:get/get.dart';

import '../modules/modules.dart';

class AppRouters {
  static List<GetPage> createRoutes() {
    return [
      GetPage(
        name: RouterLink.login,
        page: () =>  LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouterLink.register,
        page: () =>  RegisterPage(),
        binding: RegisterBindings(),
      ),
    ];
  }
}
