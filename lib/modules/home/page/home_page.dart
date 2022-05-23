import 'package:do_an/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';

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
          onTap: () {
            Get.toNamed(RouterLink.chatPage);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width(8)),
            child: SvgPicture.asset(MyIcon.chatIcon),
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
      onRefresh: () async {
        controller.getListPostNoFilter();
      },
      child: ListView(
        physics:
          BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: controller.scrollController,
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
          ListCategoryHome(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width(20), vertical: height(15)),
            child: Text(
              "Tin đặc biệt",
              style: AppStyles.textNormalGreenSemiBold,
            ),
          ),
          buildListPostPriority(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width(20), vertical: height(0)),
            child: Text(
              "Tin đăng mới nhất",
              style: AppStyles.textNormalGreenSemiBold,
            ),
          ),
          buildListPostInHome()
        ],
      ),
    );
  }

  Widget buildListPostPriority() {
    return Obx(() => Container(
          padding:
              EdgeInsets.symmetric(horizontal: width(20), vertical: height(1)),
          height: width(240),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.listPriorityPost.length,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              return Container(
                child: ItemProductWidget(
                  post: controller.listPriorityPost[index],
                ),
              );
            },
          ),
        ));
  }

  Widget buildListPostInHome() {
    return Obx(() => Container(
        padding: EdgeInsets.all(width(5)),
        child: GridView.count(
         // scrollDirection: Axis.vertical,
          physics:
          ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(width(5)),
          crossAxisCount: 2,
          crossAxisSpacing: width(10),
          mainAxisSpacing: width(10),
          childAspectRatio: 0.7,
          children: List.generate(controller.listPost.length, (index) {
            return ItemProductWidget(post: controller.listPost[index]);
          }),
        )));
  }
}
