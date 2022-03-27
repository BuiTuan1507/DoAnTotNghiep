import 'package:do_an/config/routes_link.dart';

import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/page/login_page.dart';

class AppRouters {
  static List<GetPage> createRoutes() {
    return [
      GetPage(
        name: RouterLink.login,
        page: () => const LoginPage(),
        binding: LoginBinding(),
      ),
    ];
  }
}
