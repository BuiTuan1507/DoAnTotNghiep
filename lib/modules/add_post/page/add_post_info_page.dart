import 'dart:io';
import 'package:do_an/modules/add_post/controller/add_post_info_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/routes_link.dart';
import '../../../models/register/sex_type.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/curreny_formatter.dart';
import '../widget/description_field.dart';

class AddPostInfoPage extends GetView<AddPostInfoController> {
  const AddPostInfoPage({Key? key}) : super(key: key);

  void modalSelectedConditionUse(BuildContext context) {
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
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height(20)),
                Center(
                  child: Text(
                    "Điều kiện sử dụng ",
                    style: GoogleFonts.sarabun(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: black,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      controller.listConditionUse.length,
                      (index) => InkWell(
                            onTap: () {
                              controller.selectedConditionUse.value =
                                  controller.listConditionUse[index];
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width(20), vertical: height(15)),
                              child: Text(
                                controller.listConditionUse[index],
                                style: AppStyles.textSmallDarkNormal,
                              ),
                            ),
                          )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height(20),
                  ),
                  child: ButtonApply(
                    tittle: "Quay lại",
                    style: AppStyles.textSmallWhiteMedium,
                    onClick: () => {Get.back()},
                    width: double.infinity,
                    height: height(45),
                    margin: EdgeInsets.symmetric(
                        horizontal: width(20), vertical: height(10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: greenMoney),
                  ),
                ),
              ],
            ),
          );
          // return your layout
        });
  }

  void modalSelectedFormUse(BuildContext context) {
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
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height(20)),
                Center(
                  child: Text(
                    "Hình thức ",
                    style: GoogleFonts.sarabun(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: black,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      controller.listFormUse.length,
                      (index) => InkWell(
                            onTap: () {
                              controller.selectedFormUse.value =
                                  controller.listFormUse[index];
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width(20), vertical: height(15)),
                              child: Text(
                                controller.listFormUse[index],
                                style: AppStyles.textSmallDarkNormal,
                              ),
                            ),
                          )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height(20),
                  ),
                  child: ButtonApply(
                    tittle: "Quay lại",
                    style: AppStyles.textSmallWhiteMedium,
                    onClick: () => {Get.back()},
                    width: double.infinity,
                    height: height(45),
                    margin: EdgeInsets.symmetric(
                        horizontal: width(20), vertical: height(10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: greenMoney),
                  ),
                ),
              ],
            ),
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
            "Thông tin bài đăng",
            style: AppStyles.textNormalWhiteSemiBold,
          ),
          backgroundColor: greenMoney),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCategory(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width(20), vertical: height(10)),
              child: Text(
                "Thông tin chi tiết",
                style: AppStyles.textSmallBlackMedium,
              ),
            ),
            Obx(() => (controller.file?.isEmpty ?? true)
                ? buildSelectedImage()
                : buildListImage()),
            buildConditionUse(context),
            buildForm(context),

            buildMoneyField(),
            buildTittlePostField(),
            buildInfoPostField(),
            buildAddressField(),
            buildButtonSelectPriority(),
            SizedBox(
              height: height(20),
            ),
            buildButtonAddPost(),
            SizedBox(
              height: height(20),
            ),
            Obx(() => loadingLogin(controller.isLoading.value))
          ],
        ),
      ),
    );
  }

  Widget buildTittleField(String tittle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5)),
      child: RichText(
        text: TextSpan(
          text: tittle,
          style: AppStyles.textSmallBlackMedium,
          children: <TextSpan>[
            TextSpan(
              text: ' *',
              style: AppStyles.textTinyRedMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory() {
    return Container(
      height: height(100),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTittleField("Danh mục"),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: height(1), color: grey_5),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(10), vertical: height(10)),
                child: Text(
                  (controller.mainCategory.value.sName ?? "") +
                      " - " +
                      (controller.subCategory.value.sName ?? ""),
                  style: AppStyles.textSmallBlackMedium,
                )),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedImage() {
    return InkWell(
      onTap: () async {
        if ((controller.file?.length ?? 0) <= 5) {
          await controller.openImage();
        } else {
          CommonUtil.showToast("Bạn chỉ có thể chọn tối đa 5 ảnh");
        }
      },
      child: Container(
        height: height(120),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: width(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: grey_5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_camera,
              size: size(30),
              color: greenMoney,
            ),
            SizedBox(
              height: height(10),
            ),
            Text(
              "Đăng từ 1 đến 5 ảnh",
              style: AppStyles.textSmallDarkNormal,
            )
          ],
        ),
      ),
    );
  }

  Widget buildListImage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              await controller.openImage();
            },
            child: Container(
              height: height(100),
              width: height(100),
              margin: EdgeInsets.symmetric(horizontal: width(20)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: grey_5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_camera,
                    size: size(24),
                    color: greenMoney,
                  ),
                  Text(
                    "Thêm ảnh",
                    style: AppStyles.textSmallDarkNormal,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height(100),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.file?.length ?? 0,
                itemBuilder: (context, index) => Container(
                  constraints: BoxConstraints(
                      maxHeight: height(100), maxWidth: height(100)),
                  child: Stack(children: [
                    (controller.file?.length ?? 0) > 0
                        ? Container(
                            margin: EdgeInsets.only(right: height(10)),
                            width: height(100),
                            height: height(100),
                            child: Image.file(
                              controller.file?[index] ?? File(''),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          controller.file?[index] = File('');
                          controller.file?.removeAt(index);
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: size(20),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConditionUse(BuildContext context) {
    return InkWell(
      onTap: () {
        modalSelectedConditionUse(context);
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(6)),
        height: height(60),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: height(1), color: grey_5),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTittleField("Điều kiện sử dụng"),
            Padding(
              padding: EdgeInsets.only(right: width(10)),
            ),
            Obx(() => Text(
              controller.selectedConditionUse.value,
              style: AppStyles.textSmallBlackMedium,
            )),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_drop_down,
                  size: size(22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return InkWell(
      onTap: () {
        modalSelectedFormUse(context);
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(6)),
        height: height(60),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: height(1), color: grey_5),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTittleField("Hình thức"),
            Padding(
              padding: EdgeInsets.only(right: width(10)),
            ),
            Obx(() => Text(
              controller.selectedFormUse.value,
              style: AppStyles.textSmallBlackMedium,
            )),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_drop_down,
                  size: size(22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMoneyField() {
    return Container(
        height: height(105),
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        margin: EdgeInsets.symmetric(vertical: height(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildTittleField("Giá"),
            SizedBox(height: height(8)),
            TextFormField(
                controller: controller.moneyController,
                onChanged: (text) {

                },
                inputFormatters: [
                  FilteringTextInputFormatter(
                    RegExp("[0-9]"),
                    allow: true,
                  ),
                  CurrencyFormatter()
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: AppStyles.borderDark,
                  focusedBorder: AppStyles.borderGreen,
                  enabledBorder: AppStyles.borderDark,
                  hintText: 'Nhập số tiền ...',
                  alignLabelWithHint: false,
                  hintStyle: GoogleFonts.sarabun(
                      fontSize: size(14), color: lightDarkHintText),
                  contentPadding: EdgeInsets.all(width(8)),
                ))
          ],
        ));
  }

  Widget buildTittlePostField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: width(20)),
              child: buildTittleField("Tiêu đề")),
          SizedBox(
            height: height(4),
          ),
          descriptionField(
            textEditingController: controller.tittleController,
              hintText: "Nhập tiêu đề ...",
              maxLines: 2,
              maxLength: 200,
              heightField: height(90))
        ],
      ),
    );
  }

  Widget buildInfoPostField() {
    return
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                child: buildTittleField("Thông tin")),
            SizedBox(
              height: height(4),
            ),
            descriptionField(
              textEditingController: controller.infoController,
                hintText: "Nhập thông tin ...",
                maxLines: 10,
                maxLength: 1000,
                heightField: height(250))
          ],
        ),
      );
  }

  Widget buildAddressField() {
    return InkWell(
      onTap: () async {
      await Get.toNamed(RouterLink.selectedAddressPage)?.then((value) {
        FocusManager.instance.primaryFocus?.unfocus();
        if(value != null){
          controller.address.value = value;
          controller.getAddress(controller.address.value);
        }

        });
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(6)),
        height: height(75),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: height(1), color: grey_5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTittleField("Địa chỉ"),
                Icon(
                  Icons.arrow_drop_down,
                  size: size(22),
                ),
              ],
            ),
            Obx(() => Padding(
              padding: EdgeInsets.only(top: height(0)),
              child: Text(
                controller.addressUser.value,
                style: AppStyles.textSmallBlackMedium,
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildButtonAddPost() {
    return Container(
        child: ButtonApply(
      tittle: "Đăng tin",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: () => {
        controller.addPost()
      },
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: greenMoney),
    ));
  }
  Widget buildButtonSelectPriority(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Obx(() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.listPriority.map((element) => buildPriorityItem(element)).toList(),
      )),
    );
  }

  Widget buildPriorityItem(SexType sexType) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sexType.tittle ?? "",
            style: AppStyles.textSmallGreenRegular,
          ),
          SizedBox(width: width(10),),
          InkWell(
              onTap: () {
                controller.changeTypePriority(sexType);
              },
              child: Container(
                height: width(17),
                width: width(17),
                margin: EdgeInsets.all(height(1)),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: width(1.5), color: greenMoney)),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.white, width: width(2)),
                    shape: BoxShape.circle,
                    color: (sexType.isSelected ?? false ? greenMoney : Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
