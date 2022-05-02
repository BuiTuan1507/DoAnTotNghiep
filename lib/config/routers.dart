import 'package:do_an/config/routes_link.dart';
import 'package:do_an/modules/account/page/change_password_page.dart';
import 'package:do_an/modules/home/bindings/search_bindings.dart';
import 'package:do_an/modules/home/page/search_page.dart';
import 'package:do_an/modules/register/page/loading_register_page.dart';
import 'package:do_an/modules/register/page/term_condition_register_page.dart';
import 'package:do_an/modules/register/page/tittle_register_page.dart';

import 'package:get/get.dart';

import '../modules/modules.dart';
import '../modules/register/page/birthday_register_page.dart';
import '../modules/register/page/info_account_register_page.dart';
import '../modules/register/page/name_register_page.dart';
import '../modules/splash/page/splash_page.dart';

class AppRouters {
  static List<GetPage> createRoutes() {
    return [
      GetPage(
        name: RouterLink.splash,
        page: () =>  SplashPage(),
      ),
      GetPage(
        name: RouterLink.login,
        page: () =>  LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouterLink.register,
        page: () =>  RegisterPage(),

      ),
      GetPage(
        name: RouterLink.registerTittle,
        page: () =>  TittleRegisterPage(),
        binding: RegisterBindings(),
      ),
      GetPage(
        name: RouterLink.registerNamePage,
        page: () =>  NameRegisterPage(),
      ),
      GetPage(
        name: RouterLink.registerInfoPage,
        page: () =>  InfoAccountRegisterPage(),
      ),
      GetPage(
        name: RouterLink.registerDateAndSex,
        page: () =>  BirthDayRegisterPage(),
      ),
      GetPage(
        name: RouterLink.registerTermCondition,
        page: () =>  TermConditionRegisterPage(),
      ),
      GetPage(
        name: RouterLink.registerLoading,
        page: () =>  LoadingRegister(),
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
        name: RouterLink.profileDetailPage,
        page: () =>  const AccountDetailPage(),
        binding: AccountDetailBindings(),
      ),
      GetPage(
        name: RouterLink.editProfileDetailPage,
        page: () =>  const EditAccountPage(),
        binding: EditAccountDetailBindings(),
      ),
      GetPage(
        name: RouterLink.searchPage,
        page: () =>   SearchPage(),
        binding: SearchBindings()
      ),
      GetPage(
          name: RouterLink.chatPage,
          page: () =>   ChatPage(),
          binding: ChatBindings()
      ),
      GetPage(
          name: RouterLink.chatDetailPage,
          page: () =>   ChatDetailPage(),
          binding: ChatDetailBindings()
      ),
      GetPage(
          name: RouterLink.changePasswordPage,
          page: () =>   ChangePasswordPage(),
      ),
      GetPage(
        name: RouterLink.productDetailPage,
        page: () =>   ProductDetailPage(),
        binding: ProductDetailBindings()
      ),
      GetPage(
          name: RouterLink.productDetailPage,
          page: () =>   ProductDetailPage(),
          binding: ProductDetailBindings()
      ),
      GetPage(
          name: RouterLink.productDetailPage,
          page: () =>   ProductDetailPage(),
          binding: ProductDetailBindings()
      ),
    ];
  }
}
