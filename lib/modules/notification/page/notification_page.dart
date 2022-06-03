 import 'package:do_an/modules/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class NotificationPage extends GetView<NotificationController>{
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
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                            insets: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h)),
                        labelColor: amber,
                        unselectedLabelColor: lightDarkHintText.withOpacity(0.74),
                        tabs:  [
                          Tab(
                            text: "Hoạt động" ,
                          ),
                          Tab(
                            text: "Thông báo",
                          ),
                        ],
                      ),
                    )),
              ];
            },
            body: TabBarView(
              children: [
                buildTabView(),
                buildTabView(),
              ],
            ),
          ),
        )
    );
  }
  Widget buildTabView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(child: buildListNotification())
      ],
    );
  }
  Widget buildListNotification(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: ListView.builder(
        itemCount: controller.listNotificationData.value.listNotification?.length,
          itemBuilder:(context, index) {
          return buildItemNotification(context, index);
          } ),
    );
  }
  Widget buildItemNotification(BuildContext buildContext, int index){
    return Container(

    );
  }
}