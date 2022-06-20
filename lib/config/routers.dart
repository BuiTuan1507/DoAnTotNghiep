import 'package:do_an/config/routes_link.dart';
import 'package:do_an/modules/add_post/page/loading_post_page.dart';
import 'package:do_an/modules/list_category/binding/list_category_post_bindings.dart';
import 'package:do_an/modules/list_category/page/list_category_post_page.dart';
import 'package:do_an/modules/login/bindings/forget_password_bindings.dart';
import 'package:do_an/modules/login/bindings/otp_bindings.dart';
import 'package:do_an/modules/login/page/forget_password_page.dart';
import 'package:do_an/modules/login/page/otp_page.dart';
import 'package:do_an/modules/login/page/reset_password_page.dart';
import 'package:do_an/modules/notification/bindings/rating_bindings.dart';
import 'package:do_an/modules/notification/controller/rating_post_controller.dart';
import 'package:do_an/modules/notification/page/rating_post_page.dart';
import 'package:do_an/modules/product_detail/page/watch_user_page.dart';
import 'package:get/get.dart';
import '../modules/login/bindings/reset_password_bindings.dart';
import '../modules/modules.dart';
import '../modules/product_detail/bindings/report_post_binding.dart';
import '../modules/product_detail/bindings/watch_user_bindings.dart';
import '../modules/product_detail/page/report_post_page.dart';

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
        name: RouterLink.registerTittle,
        page: () =>  TittleRegisterPage(),
      ),
      GetPage(
        name: RouterLink.registerNamePage,
        page: () =>  NameRegisterPage(),
        binding: NameRegisterBindings(),
      ),
      GetPage(
        name: RouterLink.registerInfoPage,
        page: () =>  InfoAccountRegisterPage(),
        binding: InfoAccountRegisterBindings(),
      ),
      GetPage(
        name: RouterLink.registerDateAndSex,
        page: () =>  BirthDayRegisterPage(),
        binding: BirthdayRegisterBindings(),
      ),
      GetPage(
        name: RouterLink.registerTermCondition,
        page: () =>  TermConditionRegisterPage(),
        binding: RegisterBindings(),
      ),
      GetPage(
        name: RouterLink.registerLoading,
        page: () =>  LoadingRegister(),
      ),
      GetPage(
        name: RouterLink.loadingPostPage,
        page: () =>  LoadingPostPage(),
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
        name: RouterLink.notificationPage,
        page: () =>  const NotificationPage(),
        binding: NotificationBindings(),
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
          name: RouterLink.addPostCategoryPage,
          page: () =>   AddPostCategoryPage(),
          binding: AddPostCategoryBindings()
      ),
      GetPage(
          name: RouterLink.addPostInfoPage,
          page: () =>   AddPostInfoPage(),
          binding: AddPostInfoBindings()
      ),
      GetPage(
          name: RouterLink.selectedAddressPage,
          page: () =>   SelectedAddressPage(),
          binding: SelectedAddressBindings()
      ),
      GetPage(
          name: RouterLink.addAddressPage,
          page: () =>   AddAddressPage(),
          binding: AddAddressBindings()
      ),

      GetPage(
          name: RouterLink.friendUserPage,
          page: () =>   FriendUserPage(),
          binding: FriendUserBindings()
      ),
      GetPage(
          name: RouterLink.purchaseOrderPage,
          page: () =>   PurchaseOrderPage(),
          binding: PurchaseOrderBindings()
      ),
      GetPage(
          name: RouterLink.sellOrderPage,
          page: () =>   SellOrderPage(),
          binding: SellOrderBindings()
      ),
      GetPage(
          name: RouterLink.savePostPage,
          page: () =>   SavePostPage(),
          binding: SavePostBindings()
      ),
      GetPage(
          name: RouterLink.listCategoryPostPage,
          page: () =>   ListCategoryPostPage(),
          binding: ListCategoryPostBindings()
      ),
      GetPage(
          name: RouterLink.reportPostPage,
          page: () =>   ReportPostPage(),
          binding: ReportPostBindings()
      ),
      GetPage(
          name: RouterLink.watchUserPage,
          page: () =>   WatchUserPage(),
          binding: WatchUserBindings()
      ),
      GetPage(
          name: RouterLink.ratingPostPage,
          page: () =>   RatingPostPage(),
          binding: RatingBindings()
      ),
      GetPage(
          name: RouterLink.forgetPasswordPage,
          page: () =>   ForgetPasswordPage(),
          binding: ForgetPasswordBindings()
      ),
      GetPage(
          name: RouterLink.otpPage,
          page: () =>   OTPPage(),
          binding: OTPBindings()
      ),
      GetPage(
          name: RouterLink.resetPassword,
          page: () =>   ResetPasswordPage(),
          binding: ResetPasswordBindings()
      ),
    ];
  }
}
