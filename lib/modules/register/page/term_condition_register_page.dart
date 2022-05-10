
import 'dart:developer';

import 'package:do_an/modules/modules.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class TermConditionRegisterPage extends StatefulWidget {
  const TermConditionRegisterPage({Key? key}) : super(key: key);

  @override
  State<TermConditionRegisterPage> createState() => _TermConditionRegisterPageState();
}

class _TermConditionRegisterPageState extends State<TermConditionRegisterPage> {
  final RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height(120),),
            Center(
              child: Text(
                "Hoàn tất đăng ký ",
                style: AppStyles.textLargeGreenSemiBold,
              ),
            ),
            SizedBox(
              height: height(50),
            ),
            Center(child: buildTernCondition()),
            SizedBox(height: height(70),),

            SizedBox(height: height(40),),
            buttonNext(context),

            Obx(()=>  loadingLogin(controller.isLoading.value),),

          ],
        ),
      ),
    );
  }
  Widget buildTernCondition () {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(40),vertical: height(15)),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text : "Khi bạn đăng ký, bạn đồng ý với chúng tôi về ",
            style: AppStyles.textSmallBlackMedium,

            children: <TextSpan>[
              TextSpan(
                text: "điều khoản chính sách về dịch vụ và quy định của app. ",
                style: AppStyles.textSmallGreenMedium,
                recognizer: TapGestureRecognizer()..onTap = () => log("to privacy"),
              )
            ]
        ),
      ),
    );
  }

  Widget buttonNext(BuildContext context){
    void toPage(){
      controller.register(context);
    }
    return ButtonApply(
      tittle: "Đăng kí",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: toPage,
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: greenMoney),
    );
  }
}
