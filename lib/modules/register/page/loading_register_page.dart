
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';

class LoadingRegister extends StatefulWidget {
  const LoadingRegister({Key? key}) : super(key: key);

  @override
  State<LoadingRegister> createState() => _LoadingRegisterState();
}

class _LoadingRegisterState extends State<LoadingRegister> {

  @override
  void initState()  {
     Future.delayed(const Duration(seconds: 2), (){
       Get.toNamed(RouterLink.main);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Đang tạo tài khoản", style: AppStyles.textNormalGreenSemiBold,),
            ),
            Container(
              padding: EdgeInsets.only(top: height(20)),
              child: const CupertinoActivityIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
