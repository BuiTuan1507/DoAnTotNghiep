import 'package:do_an/modules/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/post/list_notification_model.dart';
import '../../../utils/utils.dart';
import '../../account/widget/build_avatar_widget.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Thông báo",
            style: AppStyles.textNormalWhiteSemiBold,
          ),
          backgroundColor: greenMoney,
          automaticallyImplyLeading: false,
        ),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(10)),
                  child: TabBar(
                    onTap: (int index) {
                      controller.currentIndex.value = index;
                    },
                    indicatorColor: amber,
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: width(2), color: amber),
                        insets: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 10.h)),
                    labelColor: amber,
                    unselectedLabelColor: lightDarkHintText.withOpacity(0.74),
                    tabs: [
                      Obx(() => Tab(
                        text: "Hoạt động (" +
                            controller.activeNotification.length.toString() +
                            ")",
                      )),
                      Obx(() => Tab(
                        text: "Thông báo (" +
                            controller.notification.length.toString() +
                            ")",
                      )),
                    ],
                  ),
                )),
              ];
            },
            body: TabBarView(
              children: [
                Obx(
                  () => buildTabView(controller.activeNotification),
                ),
                Obx(
                  () => buildTabView(controller.notification),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildTabView(List<ListNotification> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(child: buildListNotification(list))
      ],
    );
  }

  Widget buildListNotification(List<ListNotification> list) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5)),
      child: list.isNotEmpty == true
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return buildItemNotification(context, list[index]);
              })
          : const Center(
              child: Text("Không có thông báo nào"),
            ),
    );
  }

  Widget buildItemNotification(
      BuildContext buildContext, ListNotification listNotification) {
    String image = listNotification.avatarUser ?? "";
    if (image == "") {
      image = Constants.AVATAR_URL;
    }
    return InkWell(
      onTap: () async {
        await controller.watchNotification(listNotification, buildContext);
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(12)),
        color: (listNotification.isReading ?? true)
            ? Colors.transparent
            : greenMoney.withOpacity(0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: width(60),
                width: width(60),
                child: buildAvatar(image, 30)),
            SizedBox(
              width: width(10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: controller.getTittleNotification(listNotification) +
                          " ",
                      style: AppStyles.textSmallDarkRegular,
                      children: <TextSpan>[
                        TextSpan(
                          text: controller.getContentPost(listNotification),
                          style: AppStyles.textSmallGreenSemiBold,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height(5)),
                    child: Text(
                      CommonUtil.parseDateTime(listNotification.dateTime ?? ""),
                      style: AppStyles.textTinyDarkRegular,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
