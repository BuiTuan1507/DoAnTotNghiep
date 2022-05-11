import 'package:flutter/material.dart';




final HexColor violet = HexColor("#7F3DFF");
final HexColor dark = HexColor("#212325");
final HexColor lightDark = HexColor("#F1F1FA");

final HexColor lightDarkHintText = HexColor("#91919F");
final HexColor cancelButton = HexColor("#D7D8DD");
final HexColor greenMoney = HexColor("#1877F2");
final HexColor redMoney = HexColor("#FD3C4A");
final HexColor blueMoney = HexColor("#0077FF");
final HexColor backgroundColor = HexColor("#F6F6F6");
final HexColor orangeMoney = HexColor("#FCAC12");
final HexColor violet_2 = HexColor("#EEE5FF");
final HexColor red_2 = HexColor("#FD3C4A");
final HexColor amber = HexColor("#FCAC12");

final HexColor deepIndigo = HexColor("#240066");
final HexColor azure = HexColor("#03A9F4");
final HexColor blue = HexColor("#4D7FF8");
final HexColor darkBlue = HexColor("#152764");
final HexColor white_1 = HexColor("#ECECEC");
final HexColor primaryColor = HexColor("#3FDDFE");
final HexColor purple = HexColor("#651FFF");
final HexColor lightBlue = HexColor("#1DE9B6");
final HexColor yellow = HexColor("#FFC400");
final HexColor orange = HexColor("#FF6D00");
final HexColor red = HexColor("#FF3D00");

final HexColor black = HexColor("#121212");
final HexColor grey_2 = HexColor("#454545");
final HexColor grey_3 = HexColor("#898F9C");
final HexColor grey_4 = HexColor("#A0A0A0");
final HexColor grey_5 = HexColor("#DDDDDD");
final HexColor grey_6 = HexColor("#F2F2F2");
final HexColor grey_7 = HexColor("#D9D9D9");
final HexColor grey_8 = HexColor("#9C9C9C");
final HexColor grey_9 = HexColor("#EAEEF2");
final HexColor darkGrey = HexColor("#575757");
final HexColor greySubText = HexColor("#757575");



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

