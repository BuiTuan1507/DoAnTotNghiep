import 'package:do_an/models/user/address_model.dart';
import 'package:do_an/models/user/user_info_model.dart';
import 'package:do_an/modules/account/controller/selected_address_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../utils/utils.dart';

class SelectedAddressPage extends GetView<SelectedAddressController> {
  const SelectedAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUserInfo(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chọn địa chỉ",
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
                buildAddAddress(),
                (controller.infoUser.value.listAddress?.isNotEmpty ?? false)
                    ? buildListAddressUser()
                    : Center(
                        child: Text(
                          "Bạn chưa thêm địa chỉ",
                          style: AppStyles.textSmallBlackRegular,
                        ),
                      ),
                (controller.infoUser.value.listAddress?.isNotEmpty ?? false)
                    ? buildButtonApply()
                    : Container(),
                 SizedBox(
                   height: height(50),
                 ),
                loadingLogin(controller.isLoading.value)
              ],
            ),
          )),
    );
  }

  Widget buildAddAddress() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouterLink.addAddressPage);
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width(10)),
              child: Icon(
                Icons.add,
                size: size(22),
              ),
            ),
            Text(
              "Thêm",
              style: AppStyles.textSmallBlackMedium,
            )
          ],
        ),
      ),
    );
  }

  Widget buildListAddressUser() {
    return Container(
      child: Obx(() => Column(
            children: List.generate(
                controller.listAddress.length,
                (index) => buildItemAddress(
                    addressModel: controller.listAddress[index])),
          )),
    );
  }

  Widget buildItemAddress({required ListAddress addressModel}) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.changeStatusAddress(addressModel);
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
                        color: (addressModel.isSelected ?? false)
                            ? greenMoney
                            : Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: width(15),
              ),
              Expanded(
                child: Text(
                  controller.getAddress(addressModel),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textSmallBlackRegular,
                ),
              ),
              InkWell(
                onTap: (){
                  controller.deleteAddress(addressModel);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: width(15)),
                  child: Icon(
                    Icons.delete,
                    size: size(22),
                    color: lightDarkHintText,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtonApply() {
    return Container(
        child: ButtonApply(
      tittle: "Xác nhận",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: () => {controller.confirmAddress()},
      width: double.infinity,
      height: height(60),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: greenMoney),
    ));
  }
}
