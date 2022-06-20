import 'package:do_an/modules/login/controller/otp_controller.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/utils.dart';

class OTPPage extends GetView<OTPController> {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: height(45),
                  ),
                  Center(
                    child: Text(
                      'Nhập OTP',
                      style: AppStyles.textXLGreenSemiBold,
                    ),
                  ),
                  SizedBox(
                    height: height(45),
                  ),
                  Center(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: width(26), vertical: 0),
                      child: RichText(
                        text: TextSpan(
                            text: "Mã OTP đã được gửi đến +  (" + '+84' + ") ",
                            children: [
                              TextSpan(
                                  text: controller.phoneNumber,
                                  style: TextStyle(
                                      color: Color(0xff646464),
                                      fontSize: size(12),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                  ))
                            ],
                            style: TextStyle(
                              color: Color(0xff646464),
                              fontSize: size(12),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            )),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(40),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16.h),
                      child: PinCodeTextField(
                        autoFocus: true,
                        appContext: context,
                        controller: controller.pinCodeTextFieldController,
                        pastedTextStyle: const TextStyle(
                          color: Color(0xff094496),
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {},
                        pinTheme: PinTheme(
                          borderWidth: height(1),
                          activeColor: Color(0xff90a9cb),
                          selectedColor: Color(0xff90a9cb),
                          inactiveColor: Color(0xff90a9cb),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: width(50),
                          fieldWidth: width(50),
                          fieldOuterPadding: EdgeInsets.only(left: 5.h),
                        ),

                        animationDuration: Duration(milliseconds: 200),
                        textStyle: TextStyle(
                            color: const Color(0xff094496),
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal),
                        //enableActiveFill: true,

                        keyboardType: TextInputType.number,

                        onCompleted: (v) {},
                        onChanged: (value) {
controller.otp = value;
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      )),
                  SizedBox(
                    height: 12.h,
                  ),
                  Center(
                    child: Text(
                      "0: " + controller.countDownTime.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xff094496),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Center(
                      child: InkWell(
                        onTap: () async {
                          if (controller.countDownTime == 0) {
                            //dynamic response = await model.resendOTP(model.phoneNumber);
                            dynamic response = true;
                            if (response == true) {
                              controller.startTimer();
                              CommonUtil.showToast("Mã OTP đã được gửi lại",
                                  isSuccessToast: true);
                            } else {
                              CommonUtil.showToast(
                                  "Có lỗi xảy ra, vui lòng thử lại");
                            }
                          } else {
                            CommonUtil.showToast(
                                "Mã OTP đã được gửi. Vui lòng kiểm tra");
                          }
                        },
                        child: (controller.countDownTime == 0)
                            ? RichText(
                          text: TextSpan(
                              text: "Bạn không nhận được mã ?",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xff094496),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: "Gửi lại",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color(0xff094496),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold))
                              ]),
                        )
                            : Container(),
                      )
                  ),
                  SizedBox(
                    height: 252.h,
                  ),
                  Obx(()=> buttonSendOTP( controller.otp.length == 6 ? greenMoney : grey_3),),

                  SizedBox(
                    height: 35.h,
                  ),
                ])));
  }
  Widget buttonSendOTP( HexColor color) {
    return ButtonApply(
      tittle: "Gửi",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick:() => (){},
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: color),
    );
  }

}