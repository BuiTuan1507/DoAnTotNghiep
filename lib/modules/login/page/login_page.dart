import 'package:do_an/config/config.dart';
import 'package:do_an/modules/login/controller/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';
import '../widgets/email_field.dart';
import '../widgets/password_filed.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildLogoLogin(),
              SizedBox(
                height: height(20),
              ),
              BuildTextEmailField(
                  tittle: "Số điện thoại",
                  textEditingController: controller.phoneController,
                  hintText: "Nhập số điện thoại",
                  onChanged: (text) {
                    controller.validateLogin();
                  }
              ),
              Obx(() => buildTextPasswordField(
                  tittle: "Mật khẩu",
                  textEditingController: controller.passwordController,
                  hintText: "Nhập mật khẩu",
                  isVisibility: controller.isVisibilityPassword.value,
                  changeVisibility: controller.changeVisibility)),
              const SizedBox(height: 7),
              buildForgetPassword(),
              Obx(()=> buttonLogin(context, controller.isValidateLogin.value ? greenMoney : grey_3),),
              textHaveAccount(),
              Obx(() => loadingLogin(controller.isLoading.value))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogoLogin() {
    return Container(
      height: height(200),
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Text("Chợ Bách Khoa", style: AppStyles.textXLGreenSemiBold,)),
          Expanded(child: Center(
            child: Image.asset(MyImage.logoLogin, fit: BoxFit.cover,),
          ))
        ],
      ),
    );
  }


  Widget buildForgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Get.toNamed(RouterLink.forgetPasswordPage);
        },
        child: Padding(
          padding: EdgeInsets.only(
              top: height(0), bottom: height(42), right: width(16)),
          child: Text(
            "Quên mật khẩu",
            style: AppStyles.textSmallGreenRegular,
          ),
        ),
      ),
    );
  }

  Widget buttonLogin(BuildContext context, HexColor color) {
    return ButtonApply(
      tittle: "Đăng nhập",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick:() => controller.login(context),
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: color),
    );
  }


  Widget textHaveAccount() {
    return Center(
      child: Container(
          padding: EdgeInsets.only(top: height(60)),
          child: RichText(
            text: TextSpan(
              text: "Bạn chưa có tài khoản ? ",
              style: AppStyles.textSmallDarkRegular,
              children: <TextSpan>[
                TextSpan(
                  text: ' Đăng kí',
                  style: AppStyles.textSmallGreenSemiBold,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(RouterLink.registerTittle),
                ),
              ],
            ),
          )
      ),
    );
  }
}
