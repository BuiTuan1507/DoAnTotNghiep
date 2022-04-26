import 'package:do_an/modules/account/controller/account_detail_controller.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../../modules.dart';


class AccountDetailPage extends GetView<AccountDetailController>{
  const AccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Thong tin ca nhan", style: AppStyles.textNormalBlackMedium,),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildAvatarProfile(Constants.AVATAR_URL, context),
            Center(
              child: Text("Minh Tuan", style: AppStyles.textNormalBlackMedium,),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: height(5), horizontal: width(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textFollowUser(4, "Nguoi theo doi"),
                  textFollowUser(5, "Dang theo doi")
                ],
              ),
            ),
            buildButton()
          ],
        )
      ),
    );
  }

  Widget buildAvatarProfile(String image, BuildContext context){
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
              ),),
          ],
        )
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

  Widget textFollowUser(int numberFollower, String text){
    return RichText(
      text: TextSpan(
        text: numberFollower.toString(),
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
  Widget buildButton (){
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5), horizontal: width(20)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height(45),
              decoration: BoxDecoration(
                color: grey_5,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.edit, size: size(22),color: black,),
                    SizedBox(width: width(10),),
                    Text("Chỉnh sửa trang cá nhân", style: AppStyles.textSmallBlackMedium,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: width(12),
          ),
          SizedBox(
            height: height(45),
            width: height(70),
            child: Center(
              child: Icon(Icons.more_horiz, size: size(22),),
            ),
          )
        ],
      ),
    );
  }
}