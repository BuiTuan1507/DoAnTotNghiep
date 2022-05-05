class AddressModel {
  String? address;
  bool? isSelected;

  AddressModel({this.address, this.isSelected});

  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['isSelected'] = this.isSelected;
    return data;
  }
}