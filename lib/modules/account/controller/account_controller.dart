
import 'dart:developer';
import 'dart:io';

import 'package:do_an/service/service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../respository/login_repository.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/utils.dart';
import '../../login/page/login_page.dart';

class AccountController extends GetxController {
  RxString token = "".obs;

  LoginRepository loginRepository = LoginRepository();

  RxString name = "Minh tuan".obs;
  RxString image = Constants.AVATAR_URL.obs;

  ImagePicker picker = ImagePicker();

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

  void toPageChange() {}

  void toPageAccount(){
   // Get.toNamed(Routes.walletPage);
  }
  void toPageSetting(){
   // Get.toNamed(Routes.setting);
  }

  void changeImage({required bool isCamera}) async {
    XFile? pickSingleFile;

    //pick image
    if (isCamera) {
      pickSingleFile = (await picker.pickImage(source: ImageSource.camera));
    } else {
      pickSingleFile = (await picker.pickImage(source: ImageSource.gallery));
    }
    File imageFile = File(pickSingleFile?.path ?? '');
    if(!CommonUtil.isEmpty(imageFile)){
      /*
      log("url image: ${imageFile.path}");
      String url = await uploadImageToFirebase(imageFile);
      if (url != '') {
        image.value = url;
        log("url image uploaded: $url");
        await userRepository.updateUser(uuid.value, url);
        DataGlobal.setImageUserModel(url);
      } else {
        log("Không thể thay đổi ảnh");
      }

       */

    }
  }


}
