
import 'dart:developer';
import 'dart:io';

import 'package:do_an/service/service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/routes_link.dart';
import '../../../respository/login_repository.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/utils.dart';
import '../../login/page/login_page.dart';

class AccountController extends GetxController {
  RxString token = "".obs;

  LoginRepository loginRepository = LoginRepository();

  RxString name = "Minh tuan".obs;
  RxString image = Constants.AVATAR_URL.obs;



  @override
  void onInit() {
    loadDataFromLocal();
    super.onInit();
  }

  void loadDataFromLocal() {
    token.value = GlobalData.getUserModel().token ?? "";
  }

  void logout()  {
    //  Get.offAll(()=> LoginPage());
    Get.off(() =>  LoginPage());
    /*
    try {
      Map<String,dynamic> params = {
        "token":token.value
      };
      ResponseModel model = await loginRepository.apiLogout(param: params,token: token.value);
      if(model.status){
        await GlobalData.clearUser();
        Get.offAll(()=> LoginPage());
      }
    } catch (e){
      MyDialog.popUpErrorMessage(buildContext: context, content: "Lỗi không xác định", tittle: "Lỗi");
      log(e.toString());
    }
     */
  }


  void toPageBuy(){
    Get.toNamed(RouterLink.purchaseOrderPage);
  }

  void toPageSell(){
    Get.toNamed(RouterLink.sellOrderPage);
  }

  void toPageSavePost(){
    Get.toNamed(RouterLink.savePostPage);
  }

  void toPageFriend(){
    Get.toNamed(RouterLink.friendUserPage);
  }

  void toPageSetting(){
    Get.toNamed(RouterLink.editProfileDetailPage);
  }




}
