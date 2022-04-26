import 'package:do_an/utils/common/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/theme/app_styles.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';
import '../widget/build_avatar_widget.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: height(20),
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(4)),
                child: Text(
                  "0932333703",
                  style: AppStyles.textLargeBlackSemiBold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(4)),
                child: Text(
                  "Tài khoản chưa được xác thực",
                  style: AppStyles.textTinyRedMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(15)),
                child: Text(
                  "Xem thông tin cá nhân của bạn",
                  maxLines: 1,
                  style: AppStyles.textSmallDarkRegular,
                  overflow: TextOverflow.ellipsis,
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
      padding: EdgeInsets.all(height(15)),
      margin: EdgeInsets.all(height(16)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildItem("Giỏ hàng", controller.toPageAccount, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Cài đặt".tr, controller.toPageSetting, MyIcon.cartIcon,
              Colors.red.withOpacity(0.4)),
          buildItem("Tin đã lưu".tr, controller.toPageChange, MyIcon.cartIcon,
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
                        controller.changeImage(isCamera: true);
                      },
                      iconButton: Icons.camera_alt_outlined,
                    ),
                    itemButtonSelectImage(
                        title: "Thư viện",
                        function: () {
                          controller.changeImage(isCamera: false);
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
                      onClick: () => controller.logout(),
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
}
