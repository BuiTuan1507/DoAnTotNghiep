import 'package:do_an/utils/common/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes_link.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/theme/app_styles.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';
import '../widget/build_avatar_widget.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     controller.getUserInfo(context);
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height(80),
            ),
            buildName(
              controller.name.value,
              controller.image.value,
              context,
            ),
            SizedBox(
              height: height(30),
            ),
            buildOptionalAccount(context)
          ],
        ));
  }

  Widget buildImageInfo(String? image, BuildContext context) {
    if (image == null || image == "") {
      image = Constants.AVATAR_URL;
    }
    return buildAvatar(image, 90.0);
  }

  Widget buildName(String? name, String? image, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: width(15)),
            child: buildImageInfo(image, context)),
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(4)),
                child: Text(
                  controller.infoUser.value.phoneNumber ?? "",
                  style: AppStyles.textLargeBlackSemiBold,
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(4)),
                child: Text(
                  controller.infoUser.value.point.toString() + " điểm",
                  style: AppStyles.textSmallGreenRegular,
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(RouterLink.profileDetailPage, arguments: controller.infoUser.value);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(15)),
                  child: Text(
                    "Xem thông tin cá nhân của bạn",
                    maxLines: 1,
                    style: AppStyles.textSmallDarkRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOptionalAccount(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildItem("Đơn đã mua", controller.toPageBuy, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Đơn đã bán", controller.toPageSell, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Tin đã lưu", controller.toPageSavePost, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Bạn bè".tr, controller.toPageFriend, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Cài đặt".tr, controller.toPageSetting, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Đăng xuất".tr, () => modalLogout(context), MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
        ],
      ),
    );
  }

  Widget buildItem(
      String? tittle, VoidCallback onClick, String icon, Color color) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(18)),
        child: Row(
          children: [
            Container(
                height: width(32),
                width: width(32),
                padding: EdgeInsets.all(width(6)),
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: SvgPicture.asset(
                  icon,
                  color: Colors.white,
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: width(15)),
                child: Text(
                  tittle ?? "",
                  style: AppStyles.textNormalBlackMedium,
                ),
              ),
            ),
            SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
          ],
        ),
      ),
    );
  }



  void modalLogout(BuildContext context) {
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
              SizedBox(height : height(20)),
              Center(
                child: Text(
                  "Bạn có chắc chắn đăng xuất không ?",
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: lightDarkHintText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height(10),
                ),
                child: Row(
                 
                  children: [
                    Expanded(
                        child: ButtonApply(
                        tittle: "Quay lại",
                        style: AppStyles.textSmallWhiteMedium,
                        onClick: () => {Get.back()},
                        width: double.infinity,
                        height: height(45),
                        margin: EdgeInsets.symmetric(
                            horizontal: width(10), vertical: height(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: grey_3),
                      ),
                    ),
                    SizedBox(width : width(15)),
                    Expanded(child: ButtonApply(
                      tittle: "Đăng xuất",
                      style: AppStyles.textSmallWhiteMedium,
                      onClick: () => controller.logout(context),
                      width: double.infinity,
                      height: height(45),
                      margin: EdgeInsets.symmetric(
                          horizontal: width(15), vertical: height(15)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: greenMoney),
                    ))
                  ],
                ),
              ),
            ],
          );
          // return your layout
        });
  }


}
