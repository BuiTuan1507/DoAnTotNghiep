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
    IconFeature(icon: MyIcon.googleIcon, name: "hello"),
    IconFeature(icon: MyIcon.googleIcon, name: "hello"),
    IconFeature(icon: MyIcon.googleIcon, name: "hello"),
    IconFeature(icon: MyIcon.googleIcon, name: "hello"),
    IconFeature(icon: MyIcon.googleIcon, name: "hello"),
    IconFeature(icon: MyIcon.googleIcon, name: "hello"),
  ];

}

class IconFeature {
  String? icon;
  String? name;

  IconFeature({this.icon, this.name});
}
