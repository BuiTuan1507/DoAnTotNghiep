import 'dart:io';

import 'package:do_an/models/category/category_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostInfoController extends GetxController {
  Rx<CategoryModel> categoryModel = CategoryModel().obs;

  RxList<File>? file = <File>[].obs;

  RxString conditionUser = "".obs;

  RxList<String> listConditionUse = ["Mới", "Như Mới","Tốt","Khá", "Kém","Không chọn"].obs;

  var picker = ImagePicker();

  @override
  void onInit() {
    if (Get.arguments != null) {
      categoryModel.value = Get.arguments;
    }
    super.onInit();
  }

  openImage() async {
    if (file?.isEmpty == true) {
      file?.value = await takeFile(takeImage: true) ?? <File>[];
    } else {
      List<File>? selectedFile = await takeFile(takeImage: true);
      file?.addAll((selectedFile ?? []).toList());
    }
  }

  Future<List<File>?> takeFile({required bool takeImage}) async {
    List<File>? file = <File>[];
    List<XFile>? pickedFiles;

    if (takeImage) {
      pickedFiles = await picker.pickMultiImage(imageQuality: 100);
    } else {
      pickedFiles?.first =
          (await picker.pickVideo(source: ImageSource.gallery))!;
    }

    if (pickedFiles != null) {
      for (var element in pickedFiles) {
        file.add(File(element.path));
      }
    } else {
      file = <File>[];
      // print('No file');
    }

    return file;
  }
}
