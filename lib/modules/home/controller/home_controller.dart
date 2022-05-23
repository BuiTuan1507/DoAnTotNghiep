import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class HomeController extends GetxController {
  List<String> imageBanner = [
    MyImage.imageBanner,
    MyImage.imageBanner,
    MyImage.imageBanner,
    MyImage.imageBanner,
  ];

  List<IconFeature> listIcon = [
    IconFeature(icon: MyIcon.postSellIcon, name: "Đơn  mua" , onClick: (){}, color: Colors.green.withOpacity(0.4)),
    IconFeature(icon: MyIcon.postBuyIcon, name: "Đơn  bán", onClick: (){}, color: Colors.blue.withOpacity(0.4)),
    IconFeature(icon: MyIcon.loveIcon, name: "Tin lưu", onClick: (){}, color: Colors.red.withOpacity(0.4)),
    IconFeature(icon: MyIcon.friendsUser, name: "Bạn bè", onClick: (){}, color: Colors.amber.withOpacity(0.4)),
    IconFeature(icon: MyIcon.settingIcon, name: "Cài đặt", onClick: (){}, color: Colors.grey.withOpacity(0.4)),

  ];

}

class IconFeature {
  String? icon;
  String? name;
  VoidCallback? onClick;
  Color?  color;

  IconFeature({this.icon, this.name, this.onClick, this.color});
}
