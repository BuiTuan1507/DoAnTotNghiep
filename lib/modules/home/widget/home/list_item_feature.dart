import 'package:do_an/modules/home/controller/home_controller.dart';
import 'package:do_an/utils/common/screen_utils.dart';
import 'package:flutter/cupertino.dart';
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
      height: height(100),
      padding: EdgeInsets.symmetric(horizontal: width(10)),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.listIcon.length ?? 0,
          itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: width(10)),
              width: width(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: width(30),
                    width: width(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(
                      controller.listIcon[index].icon ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text(controller.listIcon[index].name ?? ""),
                  )
                ],
              ))),
    );
  }
}
