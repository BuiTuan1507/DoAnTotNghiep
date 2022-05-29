import 'package:do_an/models/post/another_user_info_model.dart';
import 'package:do_an/modules/product_detail/controller/watch_user_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';
import '../../account/widget/build_avatar_widget.dart';

class WatchUserPage extends GetView<WatchUserController> {
  const WatchUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(
            (controller.userData.value.firstName ?? "") +
                (controller.userData.value.lastName ?? ""),
            style: AppStyles.textNormalWhiteSemiBold)),
        backgroundColor: greenMoney,
      ),
      body: Obx(() => SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildAvatarProfile(
                  controller.fullUserData.value.userInfo?.avatar ??
                      Constants.AVATAR_URL,
                  context),
              Center(
                child: Text(
                  (controller.fullUserData.value.userInfo?.firstName ?? "") +
                      " " +
                      (controller.fullUserData.value.userInfo?.lastName ?? ""),
                  style: AppStyles.textNormalBlackMedium,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height(5), horizontal: width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textFollowUser(
                        controller.fullUserData.value.userInfo?.followers ?? 0,
                        "Người theo dõi"),
                    textFollowUser(
                        controller.fullUserData.value.userInfo?.followingUser ??
                            0,
                        "Đang theo dõi")
                  ],
                ),
              ),
              SizedBox(
                height: height(12),
              ),
              buildButton(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(5)),
                child: Divider(
                  thickness: width(1),
                  indent: width(20),
                  endIndent: width(20),
                ),
              ),
              buildItemInfo(Icons.calendar_today, "Ngày tham gia",
                  controller.joinTime.value),
              buildItemInfo(Icons.star, "Đánh giá", controller.rating.value),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(0)),
                child: Divider(
                  thickness: width(1),
                  indent: width(20),
                  endIndent: width(20),
                ),
              ),
              buildTextDisplayPost(
                  controller.fullUserData.value.postData?.length.toString() ??
                      "0"),
              Obx(() => loadingLogin(controller.isLoading.value)),
              Obx(() =>
                  (controller.fullUserData.value.postData?.length ?? 0) > 0
                      ? buildListPost()
                      : buildListPostProfile())
            ],
          ))),
    );
  }

  Widget buildListPostProfile() {
    return Container();
  }

  Widget buildAvatarProfile(String image, BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(top: height(20)),
          height: width(115),
          width: width(115),
          child:
              Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
            buildAvatar(image, 40.0),
          ])),
    );
  }

  GestureDetector itemButtonSelectImage({
    required String title,
    required VoidCallback function,
    required IconData iconButton,
  }) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width(15),
          vertical: height(10),
        ),
        margin: EdgeInsets.symmetric(
          vertical: height(10),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius(8),
          ),
          color: grey_6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconButton,
            ),
            SizedBox(
              width: !CommonUtil.isEmpty(title) ? width(8) : 0,
            ),
            Text(
              title,
              style: GoogleFonts.sarabun(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: grey_2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFollowUser(int numberFollower, String text) {
    return RichText(
      text: TextSpan(
        text: numberFollower.toString() + "  ",
        style: AppStyles.textSmallBlackMedium,
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: AppStyles.textSmallDarkRegular,
          ),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: height(5), horizontal: width(20)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                controller.followUser();
              },
              child: Container(
                height: height(45),
                decoration: BoxDecoration(
                    color: (controller.fullUserData.value.userInfo?.follower ??
                        false)
                        ? greenMoney
                        : grey_5,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (controller.fullUserData.value.userInfo?.follower ??
                          false)
                          ? Text(
                        "Bỏ theo dõi",
                        style: AppStyles.textSmallWhiteMedium,
                      )
                          : Text(
                        "Theo dõi",
                        style: AppStyles.textSmallBlackMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width(12),
          ),
          Container(
            height: height(45),
            width: height(70),
            decoration: BoxDecoration(
                color: grey_5, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(
                Icons.more_horiz,
                size: size(22),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget buildItemInfo(IconData icon, String tittle, String value) {
    return Container(
      padding: EdgeInsets.only(
          left: width(20), right: width(20), bottom: height(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width(15)),
            child: Container(
              child: Icon(
                icon,
                size: size(20),
              ),
            ),
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: tittle + " : ",
                style: AppStyles.textSmallDarkRegular,
                children: <TextSpan>[
                  TextSpan(
                    text: value,
                    style: AppStyles.textSmallBlackMedium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextDisplayPost(String numberPost) {
    return Container(
      padding: EdgeInsets.only(
          left: width(20), right: width(20), bottom: height(15)),
      child: RichText(
        text: TextSpan(
          text: "Tin đã đăng ",
          style: AppStyles.textLargeBlackSemiBold,
          children: <TextSpan>[
            TextSpan(
              text: " - " + numberPost + " tin",
              style: AppStyles.textSmallDarkRegular,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListPost() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(10), vertical: height(00)),
      child: Column(
        children: List.generate(
            controller.fullUserData.value.postData?.length ?? 0,
            (index) => buildItemPostSearch(
                index, controller.fullUserData.value.postData![index])),
      ),
    );
  }

  Widget buildItemPostSearch(int index, PostData post) {
    return Container(
      height: height(120),
      //width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: width(10), vertical: height(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width(60),
            width: width(80),
            child: CacheImage(
              imageUrl:
                  post.media?.first.fileDownloadUri ?? MyImage.imageBanner,
              boxFit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: width(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          post.tittle ?? "",
                          style: AppStyles.textNormalBlackMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CommonUtil.formatMoney(post.money ?? 0),
                        style: AppStyles.textSmallRedMedium,
                      ),
                      Text(
                        CommonUtil.parseDateTime(post.createTime ?? ""),
                        style: AppStyles.textSmallDarkNormal,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
