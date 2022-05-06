import 'package:do_an/models/user/address_model.dart';
import 'package:do_an/modules/account/controller/selected_address_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/utils.dart';



class SelectedAddressPage extends GetView<SelectedAddressController>{
  const SelectedAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "Chọn địa chỉ",
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
            buildAddAddress(),
            buildListAddressUser(),
            buildButtonApply()
          ],
        ),
      ),
    );
  }
  Widget buildAddAddress(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20),vertical: height(15)),
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width(10)),
            child: Icon(Icons.add, size: size(22),),
          ),
          Text("Thêm", style: AppStyles.textSmallBlackMedium,)
        ],
      ),
    );
  }
  Widget buildListAddressUser(){
    return Container(
      child: Column(
        children: controller.listAddressModel.map((e) => buildItemAddress(addressModel: e)).toList(),
      ),
    );
  }
  Widget buildItemAddress({required AddressModel addressModel}) {
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
                  // controller.changeStateSexType(tittle);
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
                        color: (addressModel.isSelected ?? false) ? greenMoney : Colors.white),
                  ),
                ),
              ),
              SizedBox(width: width(15),),
              Expanded(
                child: Text(

                  addressModel.address ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textSmallBlackRegular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(15)),
                child: Icon(Icons.delete, size: size(22),),
              )
            ],
          ),
          
        ],
      ),
    );
  }
  Widget buildButtonApply(){
    return Container(
       child: ButtonApply(
          tittle: "Xác nhận",
          style: AppStyles.textNormalWhiteSemiBold,
          onClick:() => {},
          width: double.infinity,
          height: height(60),
          margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color: greenMoney),
        )
    );
  }
}