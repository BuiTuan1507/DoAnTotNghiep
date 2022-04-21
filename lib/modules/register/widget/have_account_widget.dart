import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../modules.dart';

Widget haveAccount(){
 return  Padding(
      padding: EdgeInsets.only(top: height(70)),
      child: InkWell(
        onTap: (){
          Get.off(LoginPage());
        },
        child: Center(
          child: Text(
            "Bạn đã có tài khoản", style: AppStyles.textSmallGreenRegular,
          ),
        ),
      ));
}
