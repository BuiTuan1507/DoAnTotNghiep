import 'dart:io';
import 'package:do_an/modules/add_post/controller/add_post_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                SizedBox(height : height(20)),
                Center(
                  child: Text(
                    "Điều kiện sử dụng ",
                    style: GoogleFonts.sarabun(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: lightDarkHintText,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(controller.listConditionUse.length, (index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                    child: Text(controller.listConditionUse[index],style: AppStyles.textSmallDarkNormal,),
                  )),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height(20),
                  ),
                  child:  ButtonApply(
                    tittle: "Quay lại",
                    style: AppStyles.textSmallWhiteMedium,
                    onClick: () => {Get.back()},
                    width: double.infinity,
                    height: height(45),
                    margin: EdgeInsets.symmetric(
                        horizontal: width(10), vertical: height(10)),
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
            Obx(() => (controller.file?.isEmpty ?? true) ? buildSelectedImage() : buildListImage()),
            buildConditionUse(context),
            buildForm(),
            buildMoneyField(),
            buildTextTittleAndInfo(),
            buildTittlePostField(),
            buildInfoPostField(),
            buildAddressField()
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
                  "Xe cộ - Xe đạp",
                  style: AppStyles.textSmallBlackMedium,
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedImage() {
    return InkWell(
      onTap: () async {
        await controller.openImage();
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
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height(120),
            width: height(120),
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
                  "Thêm ảnh",
                  style: AppStyles.textSmallDarkNormal,
                )
              ],
            ),
          ),
          SizedBox(
            height: height(100),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.file?.length ?? 0,
              itemBuilder: (context, index) => Container(
                constraints: BoxConstraints(
                    maxHeight: height(100), maxWidth: width(100)),
                child: Stack(children: [
                  (controller.file?.length ?? 0) > 0
                      ? Container(
                          margin: EdgeInsets.only(right: width(10)),
                          width: width(100),
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
                      icon: Icon(Icons.cancel, size: size(20),),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConditionUse(BuildContext context){
    return InkWell(
      onTap: (){
        modalSelectedConditionUse(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(6)),
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
            Text(
              controller.conditionUser.value,
              style: AppStyles.textSmallBlackMedium,
            )
            ,
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_drop_down, size: size(22),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildForm (){
    return InkWell(
      onTap: (){
        //modalSelectedConditionUse(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(6)),
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
            Text(
              controller.formUse.value,
              style: AppStyles.textSmallBlackMedium,
            )
            ,
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_drop_down, size: size(22),),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildMoneyField(){
    return Container(
        height: height(50),
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        margin: EdgeInsets.symmetric(vertical: height(10)),
        child: TextFormField(
            //controller: controller.moneyController,
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
            )));
  }
  Widget buildTextTittleAndInfo(){
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width(20), vertical: height(10)),
      child: Text(
        "Tiêu đề và mô tả",
        style: AppStyles.textSmallBlackMedium,
      ),
    );
  }
  Widget buildTittlePostField(){
    return descriptionField( hintText: "Nhập tiêu đề ...", maxLines: 2, maxLength: 200, heightField: height(90));
  }
  Widget buildInfoPostField(){
    return descriptionField( hintText: "Nhập tiêu đề ...", maxLines: 10, maxLength: 1000, heightField: height(250));
  }
  Widget buildAddressField(){
    return Container();
  }
}
