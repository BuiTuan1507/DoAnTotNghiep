import 'package:do_an/modules/account/controller/friend_user_controller.dart';
import 'package:do_an/modules/account/page/friend_user_page.dart';
import 'package:get/get.dart';

class FriendUserBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FriendUserController>(() => FriendUserController());
    Get.lazyPut<FriendUserPage>(() =>  FriendUserPage());
  }

}