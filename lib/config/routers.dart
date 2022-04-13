import 'package:do_an/config/routes_link.dart';
import 'package:do_an/modules/home/bindings/search_bindings.dart';
import 'package:do_an/modules/home/page/search_page.dart';
import 'package:do_an/modules/post/bindings/post_bindings.dart';
import 'package:do_an/modules/post/page/post_page.dart';

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
      GetPage(
        name: RouterLink.main,
        page: () =>  MainPage(),
        binding: MainBindings(),
      ),
      GetPage(
        name: RouterLink.homePage,
        page: () =>  const HomePage(),
        binding: HomeBindings(),
      ),
      GetPage(
        name: RouterLink.postPage,
        page: () =>  PostPage(),
        binding: PostBindings(),
      ),
      GetPage(
        name: RouterLink.addPostPage,
        page: () =>  const AddPostPage(),
        binding: AddPostBindings(),
      ),
      GetPage(
        name: RouterLink.accountPage,
        page: () =>  const AccountPage(),
        binding: AccountBindings(),
      ),
      GetPage(
        name: RouterLink.searchPage,
        page: () =>   SearchPage(),
        binding: SearchBindings()
      ),
    ];
  }
}
