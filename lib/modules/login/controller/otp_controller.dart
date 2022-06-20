import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';

class OTPController extends GetxController{
  String phoneNumber = "";
  final TextEditingController pinCodeTextFieldController = TextEditingController();

  RxInt countDownTime = 60.obs;

  Timer? timer;

  Rx<String> otp = "".obs;
  @override
  void onInit() {
    if(Get.arguments != null){
      phoneNumber = Get.arguments;
    }
    startTimer();
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
  
  void sendOTP(){
    Get.toNamed(RouterLink.resetPassword);
  }
}