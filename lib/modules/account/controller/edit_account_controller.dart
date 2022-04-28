import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/register/sex_type.dart';

class EditAccountController extends GetxController{
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordRememberController = TextEditingController();

  Rx<DateTime> dateTime = DateTime.now().obs;

  void validateFirstName(String text) {}

  void validateLastName(String text) {}

  void validateEmail (String text) {}

  RxList<SexType> listSexType  = SexType.listSexType.obs;

  RxBool isVisibilityPassword = false.obs;

  RxBool isVisibilityPasswordRemember = false.obs;




  void changeStateSexType(String name){
    int index = listSexType.indexWhere((element) => element.tittle == name);
    if(index == -1) return;
    for (var element in listSexType) {
      element.isSelected = false;
    }
    listSexType[index].isSelected = true;
    listSexType.refresh();
  }
  void changeVisibility(){

  }
 void validatePassword(String value){

 }
 void changeVisibilityRemember (){

 }
 void validateRememberPassword(String value){}

}