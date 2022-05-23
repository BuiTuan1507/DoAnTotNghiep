import 'dart:developer';
import 'dart:ui';

import 'package:do_an/utils/widget/loading_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constant.dart';
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

  static String parseDateToString(DateTime dateTime, String format,
      {String? locale}) {
    String date = "";
    try {
      date = DateFormat(format).format(dateTime);
    }catch (e) {
      log(e.toString());
    }return date;
  }

  static DateTime parseStringToDate(String date, {int utcTimeHour = 0}) {
    return DateTime.parse(date).toLocal().add(Duration(hours: utcTimeHour));
  }

  static bool checkTimeInDay(DateTime dateTime) {
    if (dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year &&
        dateTime.day == DateTime.now().day) {
      return true;
    }
    return false;
  }

 static String parseDateTime(String time) {
    String dateTimeString = "";
    try {
      DateTime dateTime = CommonUtil.parseStringToDate(
          time ,
          utcTimeHour: 0);

      if (CommonUtil.checkTimeInDay(dateTime)) {
        dateTimeString = CommonUtil.parseDateToString(dateTime, 'HH:mm');
      } else if (dateTime.year != DateTime.now().year) {
        dateTimeString =
            dateTime.month.toString() + "/" + dateTime.year.toString();
      } else {
        dateTimeString = CommonUtil.parseDateToString(dateTime, 'dd/MM');
      }
    } catch (e) {
         log(e.toString());
    }
    return dateTimeString;
  }
  ///format money

  static String getStringMoney( {required int money}) {
    int _moneyFormat = money;

    final currencyFormatter = NumberFormat('#,###', 'ID');
    String _money = currencyFormatter.format(_moneyFormat) + Constants.currency;
    return _money;
  }

  static String formatMoney (int money){
    int milion = 1000000;
    int bilion = 1000000000;
    if(money >= milion && money < bilion){
      if(money % milion == 0){
        return (money/milion.round()).toString() + " triệu";
      }else {
        return getStringMoney(money: money);
      }
    }
    if(money % bilion == 0){
      return (money/bilion.round()).toString() + " tỷ";
    }else{
      return getStringMoney(money: money);
    }
  }
}