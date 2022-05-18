import 'dart:io';

import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/models/user/user_info_model.dart';
import 'package:do_an/utils/common/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/constant.dart';

class AddPostInfoController extends GetxController {

  Rx<MainCategory> mainCategory = MainCategory().obs;

  Rx<SubCategory> subCategory = SubCategory().obs;

  RxList<File>? file = <File>[].obs;


  RxList<String> listConditionUse = ["Mới", "Như Mới","Tốt","Khá", "Kém","Không chọn"].obs;

  RxList<String> listFormUse = ["Mới", "Như Mới","Tốt","Khá", "Kém","Không chọn"].obs;

  Rx<String> selectedConditionUse = "Không chọn".obs;

  Rx<String> selectedFormUse = "Không chọn".obs;

  Rx<ListAddress> address = ListAddress().obs;

  Rx<String> addressUser = "Chưa có".obs;

  var picker = ImagePicker();

  final TextEditingController moneyController = TextEditingController();
  final TextEditingController tittleController = TextEditingController();
  final TextEditingController infoController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      mainCategory.value = Get.arguments['mainCategory'];
      subCategory.value = Get.arguments['subCategory'];
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

   String formatMoney ( String money){
    if(money == "") return "0";
    String moneyFormat = money.replaceAll(".","").replaceAll(Constants.currency,"");
    if(moneyFormat == " ") return "0";
    return moneyFormat;
  }

  bool validateTittle(String value){
    return Validator.name(value) ?? false;
  }

  void getAddress (ListAddress address){
    addressUser.value = (address.street ?? "") + "," + (address.ward ?? "") + ","+ (address.district ?? "") + "," + (address.province ?? "");
  }
}
