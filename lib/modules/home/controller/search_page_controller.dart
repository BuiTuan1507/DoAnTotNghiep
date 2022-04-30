import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  RxString keyword = "".obs;

  final TextEditingController searchController = TextEditingController();
  Future<void> searchPost(String text) async {
    keyword.value = searchController.text.trim();
  }

  List<String> text = ['a', "b", "c", "d"];
}