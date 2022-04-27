import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';
import '../controller/register_controller.dart';

class InfoAccountRegisterPage extends StatefulWidget {
  const InfoAccountRegisterPage({Key? key}) : super(key: key);

  @override
  State<InfoAccountRegisterPage> createState() =>
      _InfoAccountRegisterPageState();
}

class _InfoAccountRegisterPageState extends State<InfoAccountRegisterPage> {
  final RegisterController controller = Get.find();

  late FocusNode phoneNumberFocusNode ;

  @override
  void initState() {
    phoneNumberFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

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
                child: Text(
                  "Nhập thông tin tài khoản của bạn ?",
                  style: AppStyles.textLargeGreenSemiBold,
                ),
              ),
              SizedBox(
                height: height(50),
              ),
              buildPhoneNumberField(),
              Padding(
                  padding: EdgeInsets.only(top: height(10), bottom: height(20)),
                  child: textFormatPhoneNumber()),

              Obx(() => buildPasswordField("Nhập mật khẩu", () {
                    controller.changeVisibility();
                  },
                      controller.isVisibilityPassword.value,
                      controller.passwordController,
                      (value) => controller.validatePassword(value))),
              SizedBox(
                height: height(15),
              ),
              Obx(
                () => Visibility(
                    child: buildStrongPassword(
                        "Mật khẩu phải dài từ 8 kí tự trở lên ",
                        controller.isLengthPassword.value
                            ? greenMoney
                            : grey_3)),
              ),
              Obx(
                () => Padding(
                    padding: EdgeInsets.only(top: height(4)),
                    child: buildStrongPassword(
                        "Mật khẩu phải chứa chữ cái in hoa ",
                        controller.isContainSpecificCharacter.value
                            ? greenMoney
                            : grey_3)),
              ),
              Obx(
                () => Padding(
                    padding: EdgeInsets.only(top: height(4)),
                    child: buildStrongPassword(
                        "Mật khẩu phải chứa ít nhất một số",
                        controller.isContainNumber.value
                            ? greenMoney
                            : grey_3)),
              ),
              SizedBox(
                height: height(20),
              ),
              Obx(() => buildPasswordField("Nhập lại mật khẩu", () {
                    controller.changeVisibilityRemember();
                  }, controller.isVisibilityPasswordRemember.value,
                      controller.passwordRememberController, (value) => controller.validateRememberPassword(value))),
              Obx(
                    () => Padding(
                    padding: EdgeInsets.only(top: height(4)),
                    child: buildStrongPassword(
                        "Hai mật khẩu phải giống nhau",
                        controller.isSamePassword.value
                            ? greenMoney
                            : grey_3)),
              ),
              Padding(
                padding: EdgeInsets.only(top: height(30)),
                child: Obx(() => buttonNext(
                    controller.validateInfoAccount.value
                        ? greenMoney
                        : grey_3)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        child: TextFormField(
          controller: controller.phoneController,
          maxLines: 1,
          onChanged: (value) async {
            await controller.validatePhoneNumber(value);
          },
          inputFormatters: [
            FilteringTextInputFormatter(
              RegExp("[0-9]"),
              allow: true,
            ),
          ],
          focusNode: phoneNumberFocusNode,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Số điện thoại",
            hintStyle: AppStyles.textSmallDarkNormal,
            contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
            fillColor: Colors.white,
            border: AppStyles.borderDark,
            focusedBorder: AppStyles.borderGreen,
            enabledBorder: AppStyles.borderDark,
          ),
        ));
  }

  Widget textFormatPhoneNumber() {
    return Obx(() => Container(
          height: height(30),
          padding: EdgeInsets.symmetric(horizontal: width(20)),
          child: !controller.isValidatePhoneNumber.value &&
                  controller.phoneController.text.isNotEmpty && controller.firstClickButtonInfo.value
              ? Text(
                  "Số điện thoại không đúng định dạng",
                  style: AppStyles.textTinyRedMedium,
                )
              : Container(),
        ));
  }

  Widget buildPasswordField(
      String hintText,
      VoidCallback changeVisibility,
      bool visibilityPassword,
      TextEditingController textEditingController,
      Function(String value) onChanged) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        child: TextFormField(
          obscureText: visibilityPassword,
          controller: textEditingController,
          maxLines: 1,
          onChanged: (value) {
            onChanged(value);
          },
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyles.textSmallDarkNormal,
              contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
              //  fillColor: Colors.white,
              border: AppStyles.borderDark,
              focusedBorder: AppStyles.borderGreen,
              enabledBorder: AppStyles.borderDark,
              suffixIcon: IconButton(
                  icon: Icon(visibilityPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: visibilityPassword ? greenMoney : lightDarkHintText,
                  onPressed: changeVisibility)),
        ));
  }

  Widget buildStrongPassword(String text, HexColor color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      child: Row(
        children: [
          Container(
            width: width(12),
            height: width(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: const Icon(
              Icons.check,
              size: 8,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: width(9),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.sarabun(
                  fontSize: size(14),
                  fontWeight: FontWeight.w400,
                  color: color),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonNext(HexColor color) {
    void toPage() {
      controller.firstClickButtonInfo.value = true;

      if(!controller.isValidatePhoneNumber.value) {
        phoneNumberFocusNode.requestFocus();
      }

      if(controller.validateInfoAccount.value) {
        Get.toNamed(RouterLink.registerDateAndSex);
      }
    }

    return ButtonApply(
      tittle: "Tiếp theo",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: toPage,
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(14), color: color),
    );
  }
}
