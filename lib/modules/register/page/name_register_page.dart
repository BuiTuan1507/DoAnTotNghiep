
import 'package:do_an/modules/login/page/login_page.dart';
import 'package:do_an/modules/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../utils/utils.dart';


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
              buildNameField(),
              buildTextCheck(),
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
        children: [
          Expanded(
            child:  TextFormField(
              controller: controller.firstNameController,
              maxLines: 1,
              onChanged: (value){
                controller.validateFirstName(value);
              },
              decoration: InputDecoration(
                hintText: "Họ",
                hintStyle: AppStyles.textSmallDarkNormal,
                contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: lightDarkHintText, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: greenMoney, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: lightDarkHintText, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
          ),
          SizedBox(width: width(20),),
          Expanded(
            child:TextFormField(
              controller: controller.lastNameController,
              maxLines: 1,
              onChanged: (value){
                controller.validateLastName(value);
              },
              decoration: InputDecoration(
                hintText: "Tên",
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

  Widget buildTextCheck(){
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(0)),
      child: (controller.isValidateFirstName.value && controller.firstNameController.text.isNotEmpty || controller.isValidateLastName.value && controller.lastNameController.text.isNotEmpty) ?
      SizedBox(
        height: height(30),
        child: Row(
          children: [
            Flexible(
              child: Visibility(
                  visible: !controller.isValidateFirstName.value && controller.firstNameController.text.isNotEmpty,
                  child: buildTextWrongFormat("Họ không đúng định dạng")
              ),
              flex: 1,
            ),
            SizedBox(width: width(20),),
            Flexible(
              child: Visibility(
                  visible: !controller.isValidateLastName.value && controller.lastNameController.text.isNotEmpty,
                  child: buildTextWrongFormat("Tên không đúng định dạng")
              ),
              flex: 1,
            )
          ],
        ),
      ) : Container(
        height: height(30),
      ),
    ));
  }
  Widget buildTextWrongFormat (String text){
    return Text(text, style: AppStyles.textTinyRedMedium);
  }


  Widget buttonNext(HexColor color){
    void toPage(){
      if(controller.isValidateFirstName.value && controller.isValidateLastName.value) {
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
