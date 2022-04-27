import 'package:do_an/modules/account/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class EditAccountPage extends GetView<EditAccountController>{
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chỉnh sửa thông tin cá nhân",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildNameField()
          ],
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
                 // focusNode: firstNameFocusNode,
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
                (controller.isValidateFirstName.value && controller.firstNameController.text.isNotEmpty && controller.fistClickName.value) ? SizedBox(
                  height: height(20),
                  child: Visibility(
                      visible: !controller.isValidateFirstName.value && controller.firstNameController.text.isNotEmpty,
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
                   // focusNode: lastNameFocusNode,
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
                  (controller.isValidateLastName.value && controller.lastNameController.text.isNotEmpty && controller.fistClickName.value) ? SizedBox(
                    height: height(20),
                    child: Visibility(
                        visible: !controller.isValidateLastName.value && controller.lastNameController.text.isNotEmpty,
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
  Widget buildTextWrongFormat(String text){
    return Container();
  }
}