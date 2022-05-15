import 'package:do_an/models/register/sex_type.dart';
import 'package:do_an/modules/account/controller/edit_account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes_link.dart';
import '../../../utils/utils.dart';

class EditAccountPage extends GetView<EditAccountController> {
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
      firstDate: DateTime(1930),
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
              onDateTimeChanged: (picked) async {
                if (picked != controller.dateTime.value) {
                  controller.dateTime.value = picked;
                }
              },
              initialDateTime: controller.dateTime.value,
              minimumYear: 1930,
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
          return SizedBox(
            height: height(330),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height(10), left: width(20), right: width(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chọn giới tính",
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
                Obx(() => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: controller.listSexType
                          .map((e) => buildSexUserItem(e))
                          .toList(),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width(20)),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: height(7),
                                bottom: height(7),
                                right: width(16),
                                left: width(16)),
                            decoration: BoxDecoration(
                                border: Border.all(color: grey_5),
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white),
                            child: Center(
                                child: Text("Quay lại",
                                    style:
                                        GoogleFonts.sarabun(color: black))))),
                    SizedBox(width: width(10)),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: greenMoney),
                          padding: EdgeInsets.only(
                              top: height(7),
                              bottom: height(7),
                              right: width(16),
                              left: width(16)),
                          child: Center(
                            child: Text("Thay đổi",
                                style:
                                    GoogleFonts.sarabun(color: Colors.white)),
                          ),
                        )),
                  ]),
                )
              ],
            ),
          );
          // return your layout
        });
  }

  @override
  Widget build(BuildContext context) {
    controller.getUserInfo(context);
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
      body: Obx(() => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTextInfo(
                    "Họ",
                    controller.infoUser.value.firstName ?? "",
                    () => {
                          MyDialog.popUpSendMessage(context,
                              textEditingController: controller.firstNameController,
                              tittle: "Họ",
                              hintText: "Nhập họ của bạn ...", onCancel: () {
                            Get.back();
                            controller.firstNameController.clear();
                          }, onSubmit: () {
                            controller.updateFirstName(context);
                              })
                        }),
                buildTextInfo(
                    "Tên",
                    controller.infoUser.value.lastName ?? "",
                    () => {
                          MyDialog.popUpSendMessage(context,
                              textEditingController: controller.lastNameController,
                              tittle: "Tên",
                              hintText: "Nhập tên của bạn ...", onCancel: () {
                            Get.back();
                            controller.lastNameController.clear();
                          }, onSubmit: () {
                            controller.updateLastName(context);
                              })
                        }),
                buildTextInfo(
                    "Email",
                    controller.infoUser.value.email ?? "Chưa có email",
                    () => {
                          MyDialog.popUpSendMessage(context,
                              textEditingController: controller.emailController,
                              tittle: "Email",
                              hintText: "Nhập email của bạn ...", onCancel: () {
                            Get.back();
                            controller.emailController.clear();
                          }, onSubmit: () {
                            controller.updateEmail(context);
                              })
                        }),
                buildTextInfo(
                    "Địa chỉ",
                    (controller.infoUser.value.listAddress?.isNotEmpty ?? false)
                        ? (controller.addressUser.value)
                        : "Chưa có địa chỉ",
                    () => {
                      Get.toNamed(RouterLink.selectedAddressPage)?.then((value) {
                        if(value != null){
                          controller.getAddress(value);
                        }
                      })
                    }),
                buildTextInfo("Ngày sinh", controller.birthDay.value,
                    ()  async => {
                 await _selectDate(context),
                     await controller.updateBirthDay(context)
                }),
                buildTextInfo("Giới tính", controller.sexUser.value,
                    () => {showSelectSexUser(context)}),
                buildTextInfo("Mật  khẩu", controller.password.value,
                    () => {Get.toNamed(RouterLink.changePasswordPage)}),

                Obx(() => loadingLogin(controller.isLoading.value))
              ],
            ),
          )),
    );
  }

  Widget buildTextInfo(String tittle, String value, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height(10)),
                    child: Text(
                      tittle,
                      style: AppStyles.textSmallDarkRegular,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height(10)),
                    child: Text(
                      value,
                      style: AppStyles.textSmallBlackMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(10)),
              child: SvgPicture.asset(MyImage.rightArrow,
                  color: HexColor("#6492BC")),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSexUserItem(SexType sexType) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: InkWell(
        onTap: () {
          controller.changeStateSexType(sexType.tittle ?? "");
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: height(8)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (sexType.isSelected ?? false
                ? greenMoney.withOpacity(0.4)
                : Colors.transparent),
          ),
          child: Center(
              child: Text(
            sexType.tittle ?? "",
            style: AppStyles.textSmallBlackRegular,
          )),
        ),
      ),
    );
  }
}
