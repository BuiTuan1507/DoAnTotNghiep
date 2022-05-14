import 'dart:developer';
import 'dart:io';

import 'package:do_an/models/user/user_info_model.dart';
import 'package:do_an/respository/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../models/response_model.dart';
import '../../../models/user/set_user_infomation.dart';
import '../../../service/service.dart';
import '../../../utils/common/common_util.dart';
import '../../../utils/widget/dialog.dart';

class AccountDetailController extends GetxController{

  ImagePicker picker = ImagePicker();

  Rx<UserInfoModel> userInfoModel = UserInfoModel().obs;

  UserRepository userRepository = UserRepository();

  Rx<String> sexUser = "".obs;
  Rx<String> joinTime = "".obs;
  Rx<String> birthDay = "".obs;

  Rx<String> addressUser = "Chưa có".obs;

  Rx<String> rating = "Chưa đánh giá".obs;

  @override
  void onInit() {
    if(Get.arguments != null){
      userInfoModel.value = Get.arguments;
      initData();
    }

    super.onInit();
  }

  void initData(){
    switch (userInfoModel.value.sex){
      case 0 :
        sexUser.value = "Nam";
        break;
      case 1 :
        sexUser.value = "Nữ";
        break;
      case 2 :
        sexUser.value = "Khác";
        break;
    }
    try{
      DateTime joinTimeDate =  DateFormat("yyyy-MM-dd hh:mm:ss").parse(userInfoModel.value.created ?? "");
      DateTime birthDayTime =  DateFormat("yyyy-MM-dd hh:mm:ss").parse(userInfoModel.value.birthDay ?? "");

      joinTime.value = DateFormat("dd-MM-yyyy").format(joinTimeDate);
      birthDay.value = DateFormat("dd-MM-yyyy").format(birthDayTime);
    }catch(e){
      log(e.toString());
    }


    if(userInfoModel.value.listAddress?.isNotEmpty ?? false){
      addressUser.value = userInfoModel.value.listAddress?.first.address ?? "";
    }
   if(userInfoModel.value.rating != 0){
     rating.value = userInfoModel.value.rating.toString();
   }

  }

  void changeImage({required bool isCamera, required BuildContext context}) async {
    XFile? pickSingleFile;

    //pick image
    if (isCamera) {
      pickSingleFile = (await picker.pickImage(source: ImageSource.camera));
    } else {
      pickSingleFile = (await picker.pickImage(source: ImageSource.gallery));
    }
    File imageFile = File(pickSingleFile?.path ?? '');
    if(!CommonUtil.isEmpty(imageFile)){

      log("url image: ${imageFile.path}");
      String url = await uploadImageToFirebase(imageFile);
      if (url != '') {
        SetUserInfomation setUserInfomation = SetUserInfomation(
          firstName: userInfoModel.value.firstName,
          lastName: userInfoModel.value.lastName,
          email: userInfoModel.value.email,
          birthDay: userInfoModel.value.birthDay,
          avatar: url,
          sexUser: userInfoModel.value.sex
        );
       await  setUserInfo(setUserInfomation, context);
      } else {
        log("Không thể thay đổi ảnh");
      }
    }
    Get.back();
  }
  Future<String> uploadImageToFirebase(File image) async {
    String url = '';
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image/user" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    await uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
    });
    return url;
  }

  Future<void> setUserInfo(SetUserInfomation setUserInfomation, BuildContext context) async{
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    Map<String,dynamic> params = {
      "token":token,
      "userId":userId,
      "firstName": setUserInfomation.firstName,
      "lastName":setUserInfomation.lastName,
      "avatar":setUserInfomation.avatar,
      "email":setUserInfomation.email,
      "birthDay" :setUserInfomation.birthDay,
      "sexUser": setUserInfomation.sexUser
    };
    try{
      ResponseModel responseModel = await userRepository.apiSetUserInfo(param: params, token: token);
      if(responseModel.status){
        UserInfoModel userInfo = UserInfoModel.fromJson(responseModel.data);
        userInfoModel.value = userInfo;
      }else {
        MyDialog.popUpErrorMessage(buildContext: context, content: responseModel.message, tittle: "Thay thông tin người dùng thất bại");
      }
    }catch(e){
      MyDialog.popUpErrorMessage(buildContext: context, content: e.toString(), tittle: "Lỗi");
      log(e.toString());
    }
  }
}