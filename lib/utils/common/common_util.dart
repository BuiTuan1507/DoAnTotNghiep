import 'dart:developer';
import 'dart:ui';

import 'package:do_an/utils/widget/loading_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_color.dart';
import '../widget/toast_widget.dart';

class CommonUtil {
  static bool isEmpty(obj) {
    if (obj is String) return obj.isEmpty;
    if (obj is List) return obj.isEmpty || obj.isEmpty;
    return obj == null;
  }
  static openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  static showToast(
      String msg, {
        bool isSuccessToast = false,
      }) {
    Toast.show(
        msg: msg,
        textColor: black,
        backgroundColor: !isSuccessToast ? grey_5 : HexColor("#D0ECDB"),
        isSuccessToast: isSuccessToast);
  }
}