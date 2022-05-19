import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes_link.dart';
import '../../../models/user/user_info_model.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';
import '../../add_post/page/add_post_page.dart';
import '../../modules.dart';

class AccountDetailPage extends GetView<AccountDetailController> {
  const AccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Thông tin cá nhân",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: Obx(() => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildAvatarProfile(controller.userInfoModel.value.avatar ?? Constants.AVATAR_URL, context),
              Center(
                child: Text(
                  (controller.userInfoModel.value.firstName ?? "") + " " + (controller.userInfoModel.value.lastName ?? ""),
                  style: AppStyles.textNormalBlackMedium,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height(5), horizontal: width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textFollowUser(controller.userInfoModel.value.followers ?? 0, "Người theo dõi"),
                    textFollowUser(controller.userInfoModel.value.followingUser ?? 0, "Đang theo dõi")
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
              buildItemInfo(Icons.person, "Giới tính", controller.sexUser.value),
              buildItemInfo(Icons.calendar_today, "Ngày sinh", controller.birthDay.value),
              buildItemInfo(Icons.calendar_today, "Ngày tham gia",controller.joinTime.value),
              buildItemInfo(Icons.location_on, "Địa chỉ",
                  controller.addressUser.value),
              buildItemInfo(Icons.star, "Đánh giá", controller.rating.value),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(0)),
                child: Divider(
                  thickness: width(1),
                  indent: width(20),
                  endIndent: width(20),
                ),
              ),
              buildTextDisplayPost(controller.userInfoModel.value.posts?.length.toString() ?? "0"),
              Obx(() => (controller.userInfoModel.value.posts?.length ?? 0)  > 0 ? buildListPost() :  buildListPostProfile())
            ],
          ))),
    );
  }

  Widget buildAvatarProfile(String image, BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: height(20)),
          height: width(115),
          width: width(115),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              buildAvatar(image, 40.0),
              Positioned(
                bottom: 0,
                right: -25,
                child: RawMaterialButton(
                  onPressed: () {
                    modalSelectImage(context);
                  },
                  elevation: 2.0,
                  fillColor: const Color(0xFFF5F6F9),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.blue,
                    size: size(20),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  shape: const CircleBorder(),
                ),
              ),
            ],
          )),
    );
  }

  void modalSelectImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              radius(10),
            ),
          ),
        ),
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height(10),
                  horizontal: width(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chọn ảnh",
                      style: GoogleFonts.sarabun(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: grey_5,
                height: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemButtonSelectImage(
                      title: "Camera",
                      function: () {
                        controller.changeImage(isCamera: true, context: context);
                      },
                      iconButton: Icons.camera_alt_outlined,
                    ),
                    itemButtonSelectImage(
                        title: "Thư viện",
                        function: () {
                          controller.changeImage(isCamera: false, context: context);
                        },
                        iconButton: Icons.save_rounded),
                  ],
                ),
              ),
            ],
          );
          // return your layout
        });
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5), horizontal: width(20)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                Get.toNamed(RouterLink.editProfileDetailPage);
              },
              child: Container(
                height: height(45),
                decoration: BoxDecoration(
                    color: grey_5, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        size: size(20),
                        color: black.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: width(10),
                      ),
                      Text(
                        "Chỉnh sửa trang cá nhân",
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
    );
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

  Widget buildListPostProfile() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height(100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Bạn chưa có tin đăng nào",
              style: AppStyles.textSmallDarkRegular,
            ),
            SizedBox(
              height: height(10),
            ),
            ButtonApply(
              tittle: "Đăng tin",
              style: AppStyles.textSmallWhiteMedium,
              onClick: () => {
                Get.toNamed(RouterLink.addPostPage)
              },
              width: width(120),
              height: height(45),
              margin: EdgeInsets.symmetric(
                  horizontal: width(15), vertical: height(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: greenMoney),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListPost(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(20)),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // controller: scrollController,
        itemCount: controller.userInfoModel.value.posts?.length ?? 0,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          return buildItemPostSearch(context, index, controller.userInfoModel.value.posts![index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            indent: width(12),
            endIndent: width(12),
            height: height(1),
          );
        },
      ),
    );
  }
  Widget buildItemPostSearch (BuildContext context, int index, Posts post){
    return Container(
      height: height(120),
      //width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width(60),
            width: width(80),
            child: CacheImage(
              imageUrl: post.media?.first.fileDownloadUri ?? MyImage.imageBanner,
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
                        child: Text(post.tittle ?? "", style: AppStyles.textNormalBlackMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(post.money.toString(), style: AppStyles.textSmallRedMedium,),
                      Text (post.createTime ?? "",style: AppStyles.textSmallDarkNormal,)
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
