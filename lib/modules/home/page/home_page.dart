import 'package:do_an/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';
import '../widget/home/banner_widget.dart';
import '../widget/home/list_category_home.dart';
import '../widget/home/list_item_feature.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBodyHome(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: width(12),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Chợ Bách Khoa",
        style: AppStyles.textXLGreenSemiBold,
      ),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: width(8)),
          child: InkWell(
              onTap: () {
                Get.toNamed(RouterLink.searchPage);
              },
              child: Icon(
                Icons.search,
                color: grey_2,
              )),
        ),
        InkWell(
          onTap: (){
            Get.toNamed(RouterLink.chatPage);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width(8)),
            child: Icon(
              Icons.chat,
              color: grey_2,
            ),
          ),
        ),
        SizedBox(
          width: width(12),
        )
      ],
    );
  }

  Widget buildBodyHome() {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(12)),
            child: BannerWidget(
              imageList: controller.imageBanner,
              height: 180.h,
              width: double.infinity,
              isIndicator: 1,
              isAutoPlay: true,
            ),
          ),
          SizedBox(
            height: height(20),
          ),
          ListItemFeature(),
          SizedBox(
            height: height(20),
          ),
          ListCategoryHome()
        ],
      ),
    );
  }

}
