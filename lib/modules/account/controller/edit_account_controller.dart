import 'dart:developer';

import 'package:do_an/respository/user_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:do_an/utils/common/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/models.dart';
import '../../../models/register/sex_type.dart';
import '../../../models/user/set_user_infomation.dart';
import '../../../models/user/user_info_model.dart';
import '../../../service/service.dart';
import '../../../utils/widget/dialog.dart';
import '../../../utils/widget/loading_toast.dart';
import '../../../utils/widget/toast_widget.dart';

class EditAccountController extends GetxController{
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordRememberController = TextEditingController();

  final TextEditingController oldPasswordController = TextEditingController();

  Rx<DateTime> dateTime = DateTime.now().obs;

  Rx<String> sexUser = "".obs;

  Rx<String> birthDay = "".obs;

  Rx<String> password = "".obs;

  Rx<String> addressUser = "".obs;

  /// password
  RxString currentPassword = "".obs;

  RxBool isLengthPassword = false.obs;

  RxBool isContainSpecificCharacter = false.obs;

  RxBool isContainNumber = false.obs;

  RxBool isSamePassword = false.obs;

  RxBool validateInfoAccount = false.obs;


  RxBool isVisibilityPassword = true.obs;

  RxBool isVisibilityPasswordRemember = true.obs;

  RxBool isVisibilityOldPassword = true.obs;

  DateTime checkTime = DateTime(DateTime.now().year -13, DateTime.now().month, DateTime.now().day);

  bool validateFirstName(String text) {
    return Validator.name(text) ?? false;
  }

  bool validateLastName(String text) {
    return Validator.name(text) ?? false;
  }

  bool validateEmail (String text) {
    return Validator.email(text);
  }

  bool validateBirthDay(){
    return dateTime.value.isBefore(checkTime);
  }
  bool validateSex(){
    for(int i = 0; i < listSexType.length; i++){
      if(listSexType[i].isSelected == true){
        return true;
      }
    }
    return false;
  }

  Rx isLoading = false.obs;

  RxList<SexType> listSexType  = SexType.listSexType.obs;


  UserRepository userRepository = UserRepository();

  Rx<UserInfoModel> infoUser = UserInfoModel().obs;




  Future<void> getUserInfo(BuildContext context) async{
    isLoading.value = true;
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    try{
      Map<String,dynamic> params = {
        "token":token,
        "userId":userId
      };
      ResponseModel responseModel = await userRepository.apiGetUserInfo(param: params, token: token);
      isLoading.value = false;
      if(responseModel.status){
        UserInfoModel userInfoModel = UserInfoModel.fromJson(responseModel.data);
        infoUser.value = userInfoModel;
        initData();
      }else {
        MyDialog.popUpErrorMessage(buildContext: context, content: responseModel.message, tittle: "Lấy thông tin người dùng thất bại");
      }

    }catch(e){
      isLoading.value = false;
      MyDialog.popUpErrorMessage(buildContext: context, content: e.toString(), tittle: "Lỗi");
      log(e.toString());
    }
  }


  Future<void> setUserInfo(SetUserInfomation setUserInfomation, BuildContext context) async{
    FocusManager.instance.primaryFocus?.unfocus();
    String token = GlobalData.getUserModel().token ?? "";
    int userId = GlobalData.getUserModel().id ?? 0;
    isLoading.value = true;
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
        infoUser.value = userInfo;
        CommonUtil.showToast( "Thay đổi thông tin thành công", isSuccessToast: true);
      }else {
        MyDialog.popUpErrorMessage(buildContext: context, content: responseModel.message, tittle: "Thay thông tin thất bại");
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      MyDialog.popUpErrorMessage(buildContext: context, content: e.toString(), tittle: "Lỗi");
      log(e.toString());
    }
  }

  Future<void> updateFirstName (BuildContext context) async {
    Get.back();
    if(validateFirstName(firstNameController.text.trim())){

      SetUserInfomation setUserInfomation = SetUserInfomation(
          firstName: firstNameController.text.trim(),
          lastName: infoUser.value.lastName,
          email: infoUser.value.email,
          birthDay: infoUser.value.birthDay,
          avatar: infoUser.value.avatar,
          sexUser: infoUser.value.sex
      );
      await  setUserInfo(setUserInfomation, context);
      firstNameController.clear();
    }else {
      CommonUtil.showToast( "Họ không đúng định dạng");
    }

  }

  Future<void> updateLastName (BuildContext context) async {
    Get.back();
    if(validateLastName(lastNameController.text.trim())){

      SetUserInfomation setUserInfomation = SetUserInfomation(
          firstName: infoUser.value.firstName,
          lastName: lastNameController.text.trim(),
          email: infoUser.value.email,
          birthDay: infoUser.value.birthDay,
          avatar: infoUser.value.avatar,
          sexUser: infoUser.value.sex
      );
      await  setUserInfo(setUserInfomation, context);
      lastNameController.clear();
    }else {
      CommonUtil.showToast( "Tên không đúng định dạng");
    }

  }

  Future<void> updateEmail (BuildContext context) async {
    Get.back();
    if(validateEmail(emailController.text.trim())){

      SetUserInfomation setUserInfomation = SetUserInfomation(
          firstName: infoUser.value.firstName,
          lastName: infoUser.value.lastName,
          email: emailController.text.trim(),
          birthDay: infoUser.value.birthDay,
          avatar: infoUser.value.avatar,
          sexUser: infoUser.value.sex
      );
      await  setUserInfo(setUserInfomation, context);
      emailController.clear();
    }else {
      CommonUtil.showToast("Email không đúng định dạng" );
    }
  }

  Future<void> updateBirthDay (BuildContext context) async {
    if(validateBirthDay()){
      String _date = DateFormat('yyyy-MM-dd kk:mm:ss').format(dateTime.value);
      SetUserInfomation setUserInfomation = SetUserInfomation(
          firstName: infoUser.value.firstName,
          lastName: infoUser.value.lastName,
          email: infoUser.value.email,
          birthDay: _date,
          avatar: infoUser.value.avatar,
          sexUser: infoUser.value.sex
      );
      await  setUserInfo(setUserInfomation, context);
    }else {
      CommonUtil.showToast("Bạn phải trên 13 tuổi" );
    }

  }

  Future<void> updateSexUser (BuildContext context) async {
    Get.back();
    int _sex = 0;
    SexType sexType = listSexType.firstWhere((element) => element.isSelected == true, orElse: ()=> SexType());

    switch (sexType.tittle){
      case "Nam" :
        _sex= 0;
        break;
      case "Nữ":
        _sex= 1;
        break;
      case "Khác":
        _sex = 2;
        break;
    }
    SetUserInfomation setUserInfomation = SetUserInfomation(
        firstName: infoUser.value.firstName,
        lastName: infoUser.value.lastName,
        email: infoUser.value.email,
        birthDay: infoUser.value.birthDay,
        avatar: infoUser.value.avatar,
        sexUser: _sex
    );
    await  setUserInfo(setUserInfomation, context);
  }



  void initData(){
    switch (infoUser.value.sex){
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

    DateTime birthDayTime =  DateFormat("yyyy-MM-dd hh:mm:ss").parse(infoUser.value.birthDay ?? "");

    birthDay.value = DateFormat("dd-MM-yyyy").format(birthDayTime);

    if((infoUser.value.latitude ?? 0) > 0){
      int lengthPassword = infoUser.value.latitude ?? 0;
      password.value = "";
      for(int i = 0; i < lengthPassword; i++){
        password.value += "*";
      }
    }
    ListAddress address = infoUser.value.listAddress?.firstWhere((element) => element.id == infoUser.value.selectedId, orElse:() => ListAddress()) ?? ListAddress();
    
    addressUser.value = (address.street ?? "") + "," + (address.ward ?? "") + ","+ (address.district ?? "") + "," + (address.province ?? "");
  }

  void getAddress (ListAddress address){
    addressUser.value = (address.street ?? "") + "," + (address.ward ?? "") + ","+ (address.district ?? "") + "," + (address.province ?? "");
  }


  void changeStateSexType(String name){
    int index = listSexType.indexWhere((element) => element.tittle == name);
    if(index == -1) return;
    for (var element in listSexType) {
      element.isSelected = false;
    }
    listSexType[index].isSelected = true;
    listSexType.refresh();
  }
  void changeOldVisibility (){
    isVisibilityOldPassword.value = !isVisibilityOldPassword.value;
  }

  void changeVisibility (){
    isVisibilityPassword.value = !isVisibilityPassword.value;
  }
  void changeVisibilityRemember(){
    isVisibilityPasswordRemember.value = !isVisibilityPasswordRemember.value;
  }
  void validatePassword (String text) {
    currentPassword.value = text;
    isLengthPassword.value = text.length > 7;
    isContainSpecificCharacter.value = Validator.isCheckUppercase(text);
    isContainNumber.value = Validator.isCheckContainPasswordNumber(text);
    isSamePassword.value = (text == passwordRememberController.text.trim());
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && oldPasswordController.text.isNotEmpty;
  }
  void validateRememberPassword (String text) {
    isSamePassword.value = (text == currentPassword.value);
    validateInfoAccount.value = isSamePassword.value && isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && oldPasswordController.text.isNotEmpty;
  }

  Future<void> changePasswordAccount(BuildContext context) async {
    if(validateInfoAccount.value){
      FocusManager.instance.primaryFocus?.unfocus();
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      try{
        Map<String,dynamic> param = {
          "token":token,
          "userId":userId,
          "oldPassword":oldPasswordController.text.trim(),
          "newPassword":passwordController.text.trim()
        };
        ResponseModel responseModel = await userRepository.apiChangePassword(param: param, token: token);
        oldPasswordController.clear();
        passwordRememberController.clear();
        passwordController.clear();
        if(responseModel.status){
          CommonUtil.showToast("Thay đổi mật khẩu thành công", isSuccessToast: true);
        }else {
          MyDialog.popUpErrorMessage(buildContext: context, content: "Lỗi thay đổi mật khẩu", tittle: responseModel.message);
        }
      }catch(e){
        log(e.toString());
      }

    }else{
      if(isContainNumber.value && isContainSpecificCharacter.value && isLengthPassword.value && oldPasswordController.text.isNotEmpty){

      }else{
        CommonUtil.showToast("Mật khẩu mới nên có đủ 8 kí tự bao gồm chữ in hoa và số");
        return;
      }
      if(isSamePassword.value){
      }else{
        CommonUtil.showToast("Mật khẩu mới nhập lại phải giống nhau");
      }
    }
  }


}