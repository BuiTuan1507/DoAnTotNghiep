import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController{
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  RxBool isValidateFirstName = false.obs;

  RxBool isValidateLastName = false.obs;

  RxBool fistClickName = false.obs;

  void validateFirstName(String text) {}

  void validateLastName(String text) {}

}