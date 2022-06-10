import 'package:do_an/modules/account/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';

class MyDialog{
  static double popUpHeigth() => height(200);
  static double popUpWidth() => width(343);
  static double textTitleSize() => size(17);
  static double textNormalSize() => size(14);
  static HexColor iconColor = HexColor('#002DE3');

  static popUpSendMessageSuccess(BuildContext buildContext, String text) {
    showDialog(
        context: buildContext,
        barrierDismissible: false,
        builder: (builder) {
          return Dialog(
              insetPadding: EdgeInsets.all(width(18)),
              child: Container(
                height: height(120),
                width: width(343),
                padding: EdgeInsets.all(height(18)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SvgPicture.asset(MyIcon.successIcon, color: greenMoney,),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(text,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.sarabun(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ]),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              constraints: BoxConstraints(maxWidth: width(65)),
                              padding: EdgeInsets.all(height(10)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: grey_5),
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white),
                              // height: CommentDetailProperties.btnHeigth(),
                              // width: CommentDetailProperties.btnWidth(),
                              child: Center(
                                  child: Text('Đóng',
                                      style: TextStyle(color: black))))),
                    ]),
              ));
        });
  }
  static popUpErrorMessage(
      {required BuildContext buildContext,
        btnHuyText = 'Đóng',
        required String content,
        required String tittle}) {
    showDialog(
        context: buildContext,
        barrierDismissible: false,
        builder: (builder) {
          return Dialog(
            insetPadding: EdgeInsets.all(width(15)),
            child: Container(
              height: height(190),
              width: popUpWidth(),
              padding: EdgeInsets.only(
                top: height(5),
                bottom: height(18),
                right: width(18),
                left: width(24),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(tittle, style:AppStyles.textLargeBlackSemiBold),
                    ),
                    SizedBox(height: height(15)),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height(26),
                              width: height(26),
                              child: SvgPicture.asset(MyIcon.closeIcon,fit: BoxFit.cover,color: red,)
                          ),
                          SizedBox(width: width(11.5)),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                     content ,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.sarabun(
                                        fontSize: textNormalSize()
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                    SizedBox(height: height(24)),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: height(32),
                              width: width(65),
                              decoration: BoxDecoration(
                                  border: Border.all(color: grey_5),
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white),
                              child: Center(
                                  child: Text(btnHuyText,
                                      style: TextStyle(color: black)))),
                        ))
                  ]),
            ),
          );
        });
  }
  static popUpSendMessage(BuildContext context,
      {required final TextEditingController textEditingController,
        required String tittle,
        required String hintText,
        required VoidCallback onSubmit,
        required VoidCallback onCancel,
        String btnHuyText = 'Quay lại',
        String textButtonAccept = 'Thay đổi'}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return Dialog(
              insetPadding: EdgeInsets.all(width(18)),
              child: Container(
                height: height(255),
                width: width(343),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(tittle,
                                  style: GoogleFonts.sarabun(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.close, size: size(20),),
                              )
                            ]),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: textEditingController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: height(16), left: width(16)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                    borderSide: BorderSide(
                                        color: HexColor('#DFDFDF'), width: 1),
                                  ),
                                  filled: true,
                                  fillColor: HexColor('#F7F7FC'),
                                  hintStyle: GoogleFonts.sarabun(color: grey_4,fontSize: size(14),fontWeight: FontWeight.w400),
                                  hintText: hintText,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                    borderSide: BorderSide(
                                        width: 1, color: HexColor('#DFDFDF')),
                                  )),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: onCancel,
                                  child: Container(
                                      padding: EdgeInsets.only(top:height(7),bottom: height(7),right: width(16),left: width(16)),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grey_5),
                                          borderRadius:
                                          BorderRadius.circular(3),
                                          color: Colors.white),
                                      child: Center(
                                          child: Text(btnHuyText,
                                              style:
                                              GoogleFonts.sarabun(
                                                  color: black
                                              ))))),
                              SizedBox(width: width(10)),
                              InkWell(
                                  onTap: onSubmit,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: greenMoney),
                                    padding: EdgeInsets.only(top:height(7),bottom: height(7),right: width(16),left: width(16)),
                                    child: Center(
                                      child: Text(textButtonAccept,
                                          style: GoogleFonts.sarabun(color: Colors.white)),
                                    ),
                                  )),
                            ]),
                      ),
                    ]),
              ));
        });
  }

  static popUpAsk(BuildContext context,
      {
        required String tittle,
        required String hintText,
        required VoidCallback onSubmit,
        required VoidCallback onCancel,
        String btnHuyText = 'Quay lại',
        String textButtonAccept = 'Thay đổi'}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return Dialog(
              insetPadding: EdgeInsets.all(width(18)),
              child: Container(
                height: height(255),
                width: width(343),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tittle,
                                  style: GoogleFonts.sarabun(
                                      fontSize: size(16),
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height(10)),
                        child: Center(child: Text(hintText, style: AppStyles.textNormalBlackRegular,)),
                      ),
                      SizedBox(height: height(30),),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: onCancel,
                                  child: Container(
                                      padding: EdgeInsets.only(top:height(7),bottom: height(7),right: width(16),left: width(16)),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grey_5),
                                          borderRadius:
                                          BorderRadius.circular(3),
                                          color: Colors.white),
                                      child: Center(
                                          child: Text(btnHuyText,
                                              style:
                                              GoogleFonts.sarabun(
                                                  color: black
                                              ))))),
                              SizedBox(width: width(20)),
                              InkWell(
                                  onTap: onSubmit,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: greenMoney),
                                    padding: EdgeInsets.only(top:height(7),bottom: height(7),right: width(16),left: width(16)),
                                    child: Center(
                                      child: Text(textButtonAccept,
                                          style: GoogleFonts.sarabun(color: Colors.white)),
                                    ),
                                  )),
                            ]),
                      ),
                    ]),
              ));
        });
  }
}
