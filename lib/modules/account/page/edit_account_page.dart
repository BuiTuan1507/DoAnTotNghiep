import 'package:do_an/modules/account/controller/edit_account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class EditAccountPage extends GetView<EditAccountController>{
  const EditAccountPage({Key? key}) : super(key: key);

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.windows:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
        break;
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.dateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != controller.dateTime.value) {
      controller.dateTime.value = picked;
    }
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != controller.dateTime.value) {
                  controller.dateTime.value = picked;
                }
              },
              initialDateTime: controller.dateTime.value,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  void showSelectSexUser(BuildContext context) {
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

            ],
          );
          // return your layout
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chỉnh sửa thông tin cá nhân",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            buildTextInfo("Họ", "Bui", ()=> {
              MyDialog.popUpSendMessage(context, editAccountController: controller, tittle: "Họ", hintText: "Nhập họ của bạn ...")
            }),
            buildTextInfo("Tên", "Tuan", ()=> {
              MyDialog.popUpSendMessage(context, editAccountController: controller, tittle: "Tên", hintText: "Nhập tên của bạn ...")
            }),
            buildTextInfo("Email", "Chưa có email", ()=> {
              MyDialog.popUpSendMessage(context, editAccountController: controller, tittle: "Email", hintText: "Nhập email của bạn ...")
            }),
            buildTextInfo("Địa chỉ", "Chưa có địa chỉ", ()=> {}),
            buildTextInfo("Ngày sinh", "15/04/1999", ()=> {
              _selectDate(context)
            }),
            buildTextInfo("Giới tính", "Nam", ()=> {}),
            buildTextInfo("Danh sách yêu thích", "Chưa có danh sách yêu thích", ()=> {}),
            buildTextInfo("Mật  khẩu", "******", ()=> {})
          ],
        ),
      ),
    );
  }

  Widget  buildTextInfo(String tittle, String value, VoidCallback onClick){
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding (
                  padding: EdgeInsets.only(bottom: height(10)),
                  child: Text(tittle, style: AppStyles.textSmallDarkRegular,),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height(10)),
                  child: Text(value, style: AppStyles.textSmallBlackMedium,),
                )
              ],
            ),
            SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
          ],
        ),
      ),
    );
  }

}