import 'dart:io';

import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/models/models.dart';
import 'package:do_an/models/user/user_info_model.dart';
import 'package:do_an/respository/post_repository.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/routes_link.dart';
import '../../../service/service.dart';
import '../../../utils/utils.dart';

class AddPostInfoController extends GetxController {
  Rx<MainCategory> mainCategory = MainCategory().obs;

  Rx<SubCategory> subCategory = SubCategory().obs;

  RxList<File>? file = <File>[].obs;

  RxBool isLoading = false.obs;

  RxList<String> listConditionUse =
      ["Mới", "Như Mới", "Tốt", "Khá", "Kém", "Không chọn"].obs;

  RxList<String> listFormUse =
      ["Mới", "Như Mới", "Tốt", "Khá", "Kém", "Không chọn"].obs;

  Rx<String> selectedConditionUse = "Không chọn".obs;

  Rx<String> selectedFormUse = "Không chọn".obs;

  Rx<ListAddress> address = ListAddress().obs;

  Rx<String> addressUser = "Chưa có".obs;

  var picker = ImagePicker();

  PostRepository postRepository = PostRepository();

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

  String formatMoney(String money) {
    if (money == "") return "0";
    String moneyFormat =
        money.replaceAll(".", "").replaceAll(Constants.currency, "");
    if (moneyFormat == " ") return "0";
    return moneyFormat;
  }

  bool validateTittle(String value) {
    return Validator.name(value) ?? false;
  }

  void getAddress(ListAddress address) {
    addressUser.value = (address.street ?? "") +
        "," +
        (address.ward ?? "") +
        "," +
        (address.district ?? "") +
        "," +
        (address.province ?? "");
  }

  Future<List<String>> sendImage() async {
    List<String> listImageUrl = <String>[];
    if (file?.isNotEmpty == true) {
      file?.forEach((element) async {
        String filename = "";
        String extensionFile = "";
        String linkFile = "";

        double fileSizeByte =
            element.readAsBytesSync().lengthInBytes.toDouble();
        double fileSize = fileSizeByte / (1024 * 1024);
        bool uploadFileSuccess = false;

        if (fileSize < 10) {
          linkFile = await getImageUrl(element);
          uploadFileSuccess = !CommonUtil.isEmpty(linkFile);
          if (uploadFileSuccess) {
            listImageUrl.add(linkFile);
          }
        } else {}
      });
    }
    return listImageUrl;
  }

  Future<String> getImageUrl(File file) async {
    String image = "";
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child("image/post" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() async {
      image = await ref.getDownloadURL();
    });
    return image;
  }

  Future<void> addPost() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    isLoading.value = true;
    bool check = ((file?.isNotEmpty ?? true) && moneyController.text.isNotEmpty && tittleController.text.isNotEmpty && infoController.text.isNotEmpty && address.value.id != null);
    if (check) {
      CommonUtil.showToast("Bạn phải điền đầy đủ thông tin");
      return;
    }
    try {
      List<String> image = await sendImage();
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId,
        "idMainCategory": mainCategory.value.id,
        "mainCategory": mainCategory.value.sName,
        "idSubCategory": subCategory.value.id,
        "subCategory": subCategory.value.sName,
        "image": image,
        "conditionOfUse": selectedConditionUse.value,
        "formUse": selectedFormUse.value,
        "money": int.parse(formatMoney(moneyController.text.trim())),
        "tittle": tittleController.text.trim(),
        "content": infoController.text.trim(),
        "address": address.value.id
      };
      ResponseModel responseModel =
          await postRepository.apiAddPost(param: param, token: token);
      if (responseModel.status) {
        Get.toNamed(RouterLink.loadingPostPage);
        Get.back();
      } else {
        CommonUtil.showToast(responseModel.message);
      }
    } catch (e) {
      CommonUtil.showToast(e.toString());
    }
  }
}
