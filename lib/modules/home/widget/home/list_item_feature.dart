import 'package:do_an/modules/home/controller/home_controller.dart';
import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListItemFeature extends StatefulWidget {
  const ListItemFeature({Key? key}) : super(key: key);

  @override
  State<ListItemFeature> createState() => _ListItemFeatureState();
}

class _ListItemFeatureState extends State<ListItemFeature> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width(70),

      padding: EdgeInsets.only(left: width(10)),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.listIcon.length,
          itemBuilder: (context, index) => Container(
              padding: EdgeInsets.only(right: width(10)),
              margin: EdgeInsets.symmetric(vertical: height(5)),
              width: width(80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: width(30),
                    width: width(30),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(
                      controller.listIcon[index].icon ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: height(5)),
                    child: Text(controller.listIcon[index].name ?? "", style: AppStyles.textNormalBlackMedium,),
                  )
                ],
              ))),
    );
  }
}
