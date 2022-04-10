
import 'package:do_an/config/config.dart';
import 'package:do_an/modules/login/controller/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../../../utils/widget/button_apply.dart';
import '../widgets/email_field.dart';
import '../widgets/password_filed.dart';

class LoginPage extends GetView<LoginController>{
   LoginPage({Key? key}) : super(key: key);

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
              SizedBox(height: height(30),),
              buildTittle(),
              buildTextEmailField(tittle: "Số điện thoại", textEditingController: controller.phoneController,hintText: "Nhập số điện thoại"),
              Obx(() => buildTextPasswordField(
                  tittle: "Mật khẩu",
                  textEditingController: controller.passwordController,
                  hintText: "Nhập mật khẩu",
                  isVisibility: controller.isVisibilityPassword.value,
                  changeVisibility: controller.changeVisibility)),
              buildForgetPassword(),
              buttonLogin(),
              textHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
  Widget buildLogoLogin(){
    return Container();
  }
   Widget buildTittle(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingMedium, vertical: paddingMedium),
      child: Text("Đăng nhập", style: AppStyles.textXLBlackSemiBold,),
    );
  }
   Widget buildForgetPassword() {
     return Align(
       alignment: Alignment.centerRight,
       child: InkWell(
         onTap: () {},
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
  Widget buttonLogin(){
    return ButtonApply(
      tittle: "Đăng nhập",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: controller.login,
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: greenMoney
      ),
    );
  }
  Widget buildLoginAnotherMethod(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text("Hoặc đăng nhập với",),
        )
      ],
    );
  }
   Widget textHaveAccount() {
     return Center(
       child: Container(
           padding: EdgeInsets.symmetric(vertical: height(20)),
           child: RichText(
             text: TextSpan(
               text: "Bạn chưa có tài khoản ? ",
               style: AppStyles.textSmallDarkRegular,
               children: <TextSpan>[
                 TextSpan(
                   text: 'Đăng kí',
                   style: AppStyles.textSmallGreenSemiBold,
                   recognizer: TapGestureRecognizer()
                     ..onTap = () => Get.toNamed(RouterLink.register),
                 ),
               ],
             ),
           )),
     );
   }


}
