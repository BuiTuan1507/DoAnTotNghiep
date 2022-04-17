
import 'package:do_an/modules/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../login/widgets/email_field.dart';

class NameRegisterPage extends StatefulWidget {
  const NameRegisterPage({Key? key}) : super(key: key);

  @override
  State<NameRegisterPage> createState() => _NameRegisterPageState();
}

class _NameRegisterPageState extends State<NameRegisterPage> {
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
                child: Text("Bạn tên gì ?",style: AppStyles.textLargeGreenSemiBold,),
              ),
              buildNameField()
            ],
          ),
        ),
      ),
    );
  }
  Widget buildNameField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(20)),
      child: Row(
        children: [
          Expanded(
            child:  TextFormField(
              controller: controller.firstNameController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Họ",
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
            ),
          ),
          SizedBox(width: width(20),),
          Expanded(
            child:TextFormField(
              controller: controller.firstNameController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Họ",
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
          )
        ],
      ),
    );
  }


}
