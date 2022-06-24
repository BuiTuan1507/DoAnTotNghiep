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
            child: Obx(() => (!controller.isLoadingProvince.value) ? Column(
              //  mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height : height(20)),
                Center(
                  child: Text(
                    tittle,
                    style: GoogleFonts.sarabun(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(controller.listProvince.length, (index) => InkWell(
                    onTap:(){
                      controller.selectedProvince(controller.listProvince[index]);
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                      child: Text(controller.listProvince[index].sName ?? "",style: AppStyles.textSmallDarkNormal,),
                    ),
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
            ) : Column(
              children: [
                loadingLogin(controller.isLoadingProvince.value)
              ],
            )),
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
            child: Obx(() => (!controller.isLoadingDistrict.value) ? Column(
              //  mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height : height(20)),
                Center(
                  child: Text(
                    tittle,
                    style: GoogleFonts.sarabun(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),

                Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(controller.listDistrict.length, (index) => InkWell(
                    onTap:(){
                      controller.selectedDistrict(controller.listDistrict[index]);
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                      child: Text(controller.listDistrict[index].sName ?? "",style: AppStyles.textSmallDarkNormal,),
                    ),
                  )),
                )),

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
            ) : Column(
              children: [
                loadingLogin(controller.isLoadingDistrict.value)
              ],
            )),
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
            child: Obx(() => (!controller.isLoadingWard.value) ? Column(
              //  mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height : height(20)),
                Center(
                  child: Text(
                    tittle,
                    style: GoogleFonts.sarabun(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),

                Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(controller.listWard.length, (index) => InkWell(
                    onTap:(){
                      controller.selectedWard(controller.listWard[index]);
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
                      child: Text(controller.listWard[index].sName ?? "",style: AppStyles.textSmallDarkNormal,),
                    ),
                  )),
                )),

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
            ) : Column(
              children: [
                loadingLogin(controller.isLoadingWard.value)
              ],
            )),
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
            SizedBox(
              height: height(30),
            ),
            buildAddressField(),
            Obx(() => buildItemProvince( tittle: "Chọn tỉnh/thành phố", selected: () {
              modalSelectedProvince(context, "Chọn tỉnh");
              FocusManager.instance.primaryFocus?.unfocus();
            }, name: controller.selectedProvinceModel.value.sName ?? ""),),
            Divider(
              indent: width(20),
              endIndent: width(20),
              height: height(1),
            ),
            Obx(() => buildItemProvince(tittle: "Chọn quận/huyện", selected: () async {
              if(controller.selectedProvinceModel.value.sName != null ){
                await controller.getListDistrict();
                modalSelectedDistrict(context, "Chọn huyện");
              }

            },name: controller.selectedDistrictAddressModel.value.sName ?? ""),),
            Divider(
              indent: width(20),
              endIndent: width(20),
              height: height(1),
            ),
            Obx(()=>buildItemProvince(tittle: "Chọn phường/xã", selected: () async {
              if(controller.selectedDistrictAddressModel.value.sName != null)  {
                await controller.getListWard();
                modalSelectedWard(context, "Chọn xã");
              }

            }, name: controller.selectedWardAddressModel.value.sName ?? ""),),
            SizedBox(
              height: height(30),
            ),
            buildButtonAddAddress(context)
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
           controller: controller.streetController,
            onChanged: (text) {
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
  Widget buildButtonAddAddress(BuildContext context){
    return ButtonApply(
      tittle: "Xác nhận",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick:() => {controller.createAddress(context)},
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: greenMoney),
    );
  }



}