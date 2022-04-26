import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/common/common_util.dart';

class AccountDetailController extends GetxController{

  ImagePicker picker = ImagePicker();

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