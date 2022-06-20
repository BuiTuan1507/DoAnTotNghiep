import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  String phoneNumber = "";
  final TextEditingController pinCodeTextFieldController = TextEditingController();

  RxInt countDownTime = 60.obs;

  Timer? timer;

  String otp = "";
  @override
  void onInit() {
    if(Get.arguments != null){
      phoneNumber = Get.arguments;
    }
    super.onInit();
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (countDownTime.value == 0) {
          timer.cancel();
        } else {
          countDownTime.value = countDownTime.value - 1;
        }
      },
    );
  }
}