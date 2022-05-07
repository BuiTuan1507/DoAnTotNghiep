import 'package:do_an/modules/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class PostPage extends GetView<PostController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quản lí tin đăng",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        backgroundColor: greenMoney,
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 5,
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
                      isScrollable: true,
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

                          text: 'Đang hiển thị ('+ controller.countPost.toString()+")" ,
                        ),
                        Tab(
                          text: 'Chờ duyệt ('+ controller.pendingPost.toString()+")",
                        ),
                        Tab(
                          text: 'Hết hạn ('+ controller.expirePost.toString()+")",
                        ),
                        Tab(
                          text: 'Không được duyệt ('+ controller.notApprovePost.toString()+")",
                        ),
                        Tab(
                          text: 'Ẩn tin ('+ controller.hiddenPost.toString()+")",
                        )
                      ],
                    ),
                  )),
            ];
          },
          body: TabBarView(
            children: [
              buildTabView(),
              buildTabView(),
              buildTabView(),
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
        Expanded(child: buildListPost())
      ],
    );
  }
  Widget buildListPost(){
    return Container(
      child: Center(
        child: Text("Không có sản phẩm nào"),
      ),
    );
  }
}