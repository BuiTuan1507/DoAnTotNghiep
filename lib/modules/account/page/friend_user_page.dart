import 'package:do_an/modules/account/controller/friend_user_controller.dart';
import 'package:do_an/utils/widget/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/post/list_friends_model.dart';
import '../../../utils/utils.dart';

class FriendUserPage extends GetView<FriendUserController> {
  const FriendUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Bạn bè",
              style: AppStyles.textNormalWhiteSemiBold,
            ),
            backgroundColor: greenMoney),
        body: Obx(() => DefaultTabController(
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
                            borderSide:
                                BorderSide(width: width(2), color: amber),
                            insets: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 10.h)),
                        labelColor: amber,
                        unselectedLabelColor:
                            lightDarkHintText.withOpacity(0.74),
                        tabs: [
                          Tab(
                            text: 'Theo dõi (' +
                                (controller.listFriends.value.follower
                                            ?.length ??
                                        0)
                                    .toString() +
                                ")",
                          ),
                          Tab(
                            text: 'Được theo dõi (' +
                                (controller.listFriends.value.followerOf
                                            ?.length ??
                                        0)
                                    .toString() +
                                ")",
                          ),
                        ],
                      ),
                    )),
                  ];
                },
                body: TabBarView(
                  children: [
                    buildTabView(
                        controller.listFriends.value.follower ?? <Follower>[],
                        true),
                    buildTabView(
                        controller.listFriends.value.followerOf ?? <Follower>[],
                        false),
                  ],
                ),
              ),
            )));
  }

  Widget buildTabView(List<Follower> follower, bool isFollower) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(child: buildListPost(follower, isFollower))
      ],
    );
  }

  Widget buildListPost(List<Follower> follower, bool isFollower) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: (follower.length) == 0,
            child: Container(
              child: Center(
                child: Text(
                  "Danh sách theo dõi trống",
                  style: AppStyles.textNormalBlackMedium,
                ),
              ),
            ),
          ),
          Visibility(
            visible: (follower.length) > 0,
            child: Column(
              children: List.generate(follower.length, (index) {
                return buildItemFriends(follower[index], isFollower);
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemFriends(Follower follower, bool isFollower) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: width(20)),
            height: height(60),
            width: height(60),
            child: CacheImage(
              imageUrl: follower.avatar,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (follower.firstName ?? "") + " " + (follower.lastName ?? ""),
                  style: AppStyles.textNormalBlackMedium,
                ),
                Visibility(
                  visible: isFollower,
                  child: InkWell(
                    onTap: () {
                      controller.followUser(follower);
                    },
                    child: Container(
                      height: height(40),
                      width: height(70),
                      padding: EdgeInsets.symmetric(horizontal: width(5), vertical: height(4)),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: height(1), color: greenMoney),
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: height(28),
                        width: height(28),
                        child: SvgPicture.asset(
                          MyIcon.friendsUser,
                          color: greenMoney,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
