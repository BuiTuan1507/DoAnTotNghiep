import 'package:get/get.dart';

import '../../../models/user/address_model.dart';

class SelectedAddressController extends GetxController {
  List<AddressModel> listAddressModel = [
    AddressModel(address: "So 1 , duong Minh Khai, Hoàng Mai, Hà Nội", isSelected: true),
    AddressModel(address: "So 1 , duong Minh Khai, Hoàng Mai, Hà Nội", isSelected: false),
    AddressModel(address: "So 1 , duong Minh Khai, Hoàng Mai, Hà Nội", isSelected: false),
    AddressModel(address: "So 1 , duong Minh Khai, Hoàng Mai, Hà Nội", isSelected: false),
  ];
}
