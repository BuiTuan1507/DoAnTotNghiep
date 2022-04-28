import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController{
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Rx<DateTime> dateTime = DateTime.now().obs;

  void validateFirstName(String text) {}

  void validateLastName(String text) {}

  void validateEmail (String text) {}

}