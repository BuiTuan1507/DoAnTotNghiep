
import 'package:do_an/modules/main/controller/main_controller.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';

class LoadingPostPage extends StatefulWidget {
  const LoadingPostPage({Key? key}) : super(key: key);

  @override
  State<LoadingPostPage> createState() => _LoadingPostPageState();
}

class _LoadingPostPageState extends State<LoadingPostPage> {

  @override
  void initState()  {
    Future.delayed(const Duration(seconds: 2), (){
      bool test = Get.isRegistered<MainController>();
      if(test){
        MainController mainController = Get.find();
        mainController.currentIndex.value = 1;
      }else{
        MainController mainController = Get.put(MainController());
        mainController.currentIndex.value = 1;
      }


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
              child: Text("Đang tạo bài đăng", style: AppStyles.textNormalGreenSemiBold,),
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
