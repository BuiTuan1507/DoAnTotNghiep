import 'package:do_an/modules/account/controller/add_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

class AddAddressPage extends GetView<AddAddressController>{
  const AddAddressPage({Key? key}) : super(key: key);

  void modalSelectedProvince(BuildContext context, String tittle) {
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
                    tittle,
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
                  children: List.generate(controller.provinceName.length, (index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                    child: Text(controller.provinceName[index],style: AppStyles.textSmallDarkNormal,),
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

  void modalSelectedDistrict(BuildContext context, String tittle) {
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
                    tittle,
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
                  children: List.generate(controller.districtName.length, (index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                    child: Text(controller.districtName[index],style: AppStyles.textSmallDarkNormal,),
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

  void modalSelectedWard(BuildContext context, String tittle) {
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
                    tittle,
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
                  children: List.generate(controller.wardsName.length, (index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                    child: Text(controller.wardsName[index],style: AppStyles.textSmallDarkNormal,),
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
          "Thêm vị trí",
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
            buildAddressField(),
            buildItemProvince( tittle: "Chọn tỉnh/thành phố", selected: () {
              modalSelectedProvince(context, "Chọn tỉnh");
            }, name: "Hà Nội"),
            Divider(
              indent: width(20),
              endIndent: width(20),
              height: height(1),
            ),
            buildItemProvince(tittle: "Chọn quận/huyện", selected: () {
              modalSelectedDistrict(context, "Chọn huyện");
            }, name: "Hai Bà Trưng"),
            Divider(
              indent: width(20),
              endIndent: width(20),
              height: height(1),
            ),
            buildItemProvince(tittle: "Chọn phường/xã", selected: () {
              modalSelectedWard(context, "Chọn xã");
            }, name: "Minh Khai"),
            SizedBox(
              height: height(30),
            ),
            buildButtonAddAddress()
          ],
        ),
      ),
    );
  }
  Widget buildAddressField(){
    return Container(
        height: height(50),
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        margin: EdgeInsets.symmetric(vertical: height(10)),
        child: TextFormField(
          // controller: controller.descriptionEditingController,
            onChanged: (text) {
              //    controller.validateAddTransaction();
            },
            maxLines: 1,
            decoration: InputDecoration(
              border: AppStyles.borderDark,
              focusedBorder: AppStyles.borderGreen,
              enabledBorder: AppStyles.borderDark,
              hintText: "Nhập số nhà , tên đường ...",
              alignLabelWithHint: false,
              hintStyle: GoogleFonts.sarabun(
                  fontSize: size(14), color: lightDarkHintText),
              contentPadding: EdgeInsets.all(width(8)),
            )));
  }
  Widget buildItemProvince({required String tittle, required VoidCallback selected, required String name}){
    return InkWell(
      onTap: selected,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width(15)),
              child: Text(
                tittle ,
                style: AppStyles.textSmallBlackRegular,
              ),
            ),
            Expanded(
              child: Text(
                name ,
                style: AppStyles.textSmallBlackRegular,
              ),
            ),
            SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
          ],
        ),
      ),
    );
  }
  Widget buildButtonAddAddress(){
    return ButtonApply(
      tittle: "Xác nhận",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick:() => {},
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: greenMoney),
    );
  }

}