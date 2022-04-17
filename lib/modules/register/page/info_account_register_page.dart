import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controller/register_controller.dart';

class InfoAccountRegisterPage extends StatefulWidget {
  const InfoAccountRegisterPage({Key? key}) : super(key: key);

  @override
  State<InfoAccountRegisterPage> createState() => _InfoAccountRegisterPageState();
}

class _InfoAccountRegisterPageState extends State<InfoAccountRegisterPage> {
  final RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height(120),
              ),
              Center(
                child: Text("Nhập thông tin tài khoản của bạn ?",style: AppStyles.textLargeGreenSemiBold,),
              ),
              SizedBox(height: height(30),),
              buildPhoneNumberField(),
              SizedBox(height: height(30),),
              buildPasswordField()

            ],
          ),
        ),
      ),
    );
  }
  Widget buildPhoneNumberField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      child: TextFormField(
        controller: controller.phoneController,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "Số điện thoại",
          hintStyle: AppStyles.textSmallDarkNormal,
          contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: lightDarkHintText, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: greenMoney, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: lightDarkHintText, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      )
    );
  }

  Widget buildPasswordField(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        child: TextFormField(
          controller: controller.passwordController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "Mật khẩu",
            hintStyle: AppStyles.textSmallDarkNormal,
            contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide:
              BorderSide(color: lightDarkHintText, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: greenMoney, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: lightDarkHintText, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        )
    );
  }
}
