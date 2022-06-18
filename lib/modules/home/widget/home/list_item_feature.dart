import 'package:do_an/modules/home/controller/home_controller.dart';
import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

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
          itemBuilder: (context, index) =>
              Container(
              padding: EdgeInsets.only(right: width(10)),
              margin: EdgeInsets.symmetric(vertical: height(5)),
              width: width(80),
              child: buildItem(controller.listIcon[index])
              )
      ),
    );
  }

  Widget buildItem(IconFeature iconFeature){
    return InkWell(
      onTap: iconFeature.onClick,
      child: Container(
        child: Column(
          children: [
            Container(
                height: width(36),
                width: width(36),
                padding: EdgeInsets.all(width(6)),
                decoration: BoxDecoration(shape: BoxShape.circle, color: iconFeature.color),
                child: SvgPicture.asset(
                  iconFeature.icon!,
                  color: Colors.white,
                )),
            Container(
              padding: EdgeInsets.only(top: height(5)),
              child: Text(iconFeature.name ?? "", style: AppStyles.textSmallBlackMedium,),
            )
          ],
        ),
      ),
    );
  }


}
