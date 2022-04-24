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
          height: height(40),
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
    if(image == null || image == ""){
      image = Constants.AVATAR_URL;
    }
    return Center(
      child: SizedBox(
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
              ),),
          ],
        ),
      ),
    );
  }

  Widget buildName(String? name, String? image, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(left: width(15)),
            child: buildImageInfo(image, context)
        ),
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(18), vertical: height(8)),
                child: Text("Thông tin cá nhân", style: AppStyles.textLargeBlackSemiBold,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(18)),
                child: Text(
                  name ?? '',
                  maxLines: 1,
                  style: AppStyles.textLargeBlackSemiBold,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(right: width(20), top: height(12)),
            child: Icon(
              Icons.edit,
              size: size(24),
              color: lightDarkHintText,
            ),
          ),
        )
      ],
    );
  }

  Widget buildOptionalAccount(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(height(15)),
      margin: EdgeInsets.all(height(16)),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildItem(
            "profile".tr, controller.toPageAccount,),
          Divider(
            color: lightDark,
            thickness: width(1),
            indent: width(16),
            endIndent: width(16),
          ),
          buildItem("setting".tr, controller.toPageSetting),
          Divider(
            color: lightDark,
            thickness: width(1),
            indent: width(16),
            endIndent: width(16),
          ),
          buildItem("export".tr, controller.toPageChange),
          Divider(
            color: lightDark,
            thickness: width(1),
            indent: width(16),
            endIndent: width(16),
          ),
          buildItem("log_out".tr, () =>  controller.logout()),
        ],
      ),
    );
  }

  Widget buildItem(String? tittle, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.all(width(15)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                tittle ?? "",
                style: AppStyles.textNormalBlackMedium,
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
                      child: const Icon(Icons.close_rounded,),),
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
                        iconButton: Icons.save_rounded
                    ),
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
