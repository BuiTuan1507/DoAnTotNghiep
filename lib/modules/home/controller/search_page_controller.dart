import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  final TextEditingController searchController = TextEditingController();
  Future<void> searchTransaction(String text) async {
    log(text);
  }

  List<String> text = ['a', "b", "c", "d"];
}