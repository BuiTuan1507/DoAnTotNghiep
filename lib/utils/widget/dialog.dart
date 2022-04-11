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
                        SvgPicture.asset(MyIcon.successIcon),
                        const SizedBox(width: 10),
                        Text(text,
                            style: GoogleFonts.sarabun(
                                fontSize: 16, fontWeight: FontWeight.bold)),
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

}
