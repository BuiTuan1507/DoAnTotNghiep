
import 'dart:developer';

import 'package:do_an/models/register/register_user_model.dart';
import 'package:do_an/modules/login/page/login_page.dart';
import 'package:do_an/modules/modules.dart';
import 'package:do_an/modules/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../utils/utils.dart';


class NameRegisterPage extends GetView<NameRegisterController>{

  const NameRegisterPage({Key? key}) : super(key: key);



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
              buildNameField(),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(20),
              ),
                child: Center(
                  child: Text("Bạn nên sử dụng tên thật của mình", style: AppStyles.textSmallDarkRegular,),
                ),
              ),

              SizedBox(
                height: height(70),
              ),
              Obx(()=> buttonNext(controller.isValidateFirstName.value && controller.isValidateLastName.value ? greenMoney : grey_3)),

              Padding(
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
                  ))
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child:  Obx(() => Column(
              children: [
                TextFormField(
                  controller: controller.firstNameController,
                  maxLines: 1,
                  focusNode: controller.firstNameFocusNode,
                  onChanged: (value){
                    controller.validateFirstName(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Họ",
                    hintStyle: AppStyles.textSmallDarkNormal,
                    contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
                    fillColor: Colors.white,
                    border: AppStyles.borderDark,
                    focusedBorder: AppStyles.borderGreen,
                    enabledBorder: AppStyles.borderDark,
                  ),
                ),
                (!(controller.isValidateFirstName.value && controller.firstNameController.text.isNotEmpty) && controller.fistClickName.value) ? SizedBox(
                  height: height(20),
                  child: Visibility(
                      visible: !(controller.isValidateFirstName.value && controller.firstNameController.text.isNotEmpty),
                      child: buildTextWrongFormat("Họ không đúng định dạng")
                  ),
                ) : SizedBox(height: height(20),)
              ],
            )),
          ),
          SizedBox(width: width(20),),
          Expanded(
            child: Obx(() => Column(
              children: [
                TextFormField(
                  controller: controller.lastNameController,
                  maxLines: 1,
                  focusNode: controller.lastNameFocusNode,
                  onChanged: (value){
                    controller.validateLastName(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Tên",
                    hintStyle: AppStyles.textSmallDarkNormal,
                    contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
                    fillColor: Colors.white,
                    border: AppStyles.borderDark,
                    focusedBorder: AppStyles.borderGreen,
                    enabledBorder: AppStyles.borderDark,
                  ),
                ),
                (!(controller.isValidateLastName.value && controller.lastNameController.text.isNotEmpty) && controller.fistClickName.value) ? SizedBox(
                  height: height(20),
                  child: Visibility(
                      visible: !(controller.isValidateLastName.value && controller.lastNameController.text.isNotEmpty),
                      child: buildTextWrongFormat("Tên không đúng định dạng")
                  ),
                ) : SizedBox(height: height(20),)
              ],
            ))
          )
        ],
      ),
    );
  }


  Widget buildTextWrongFormat (String text){
    return Text(text, style: AppStyles.textTinyRedMedium);
  }


  Widget buttonNext(HexColor color){
    void toPage(){
      controller.fistClickName.value = true;

      if(!controller.isValidateFirstName.value ) {
        controller.firstNameFocusNode.requestFocus();
      }else if(!controller.isValidateLastName.value) {
        controller.lastNameFocusNode.requestFocus();
      }
      if(controller.isValidateFirstName.value && controller.isValidateLastName.value) {
        RegisterUserModel registerUserModel = RegisterUserModel(firstName: controller.firstNameController.text, lastName: controller.lastNameController.text);
        RegisterSingleton.setModel(registerUserModel);
        Get.toNamed(RouterLink.registerInfoPage);
      }
    }
    return ButtonApply(
      tittle: "Tiếp theo",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: toPage,
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: color),
    );
  }

}
