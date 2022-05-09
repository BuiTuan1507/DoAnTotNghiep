import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class NameRegisterController extends GetxController{
  late FocusNode firstNameFocusNode ;
  late FocusNode lastNameFocusNode ;


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  RxBool isValidateFirstName = false.obs;

  RxBool isValidateLastName = false.obs;

  RxBool fistClickName = false.obs;

  @override
  void onInit() {
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    super.onInit();
  }
  @override
  void dispose() {
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  void validateFirstName (String text){
    isValidateFirstName.value = Validator.name(text) ?? false;
  }
  void validateLastName (String text){
    isValidateLastName.value = Validator.name(
        text
    ) ?? false;
  }

}