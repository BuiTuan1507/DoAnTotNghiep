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

class ProvinceAddressModel {
  int? id;
  String? sName;
  String? sCode;

  ProvinceAddressModel({this.id, this.sName, this.sCode});

  ProvinceAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['_name'];
    sCode = json['_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_name'] = this.sName;
    data['_code'] = this.sCode;
    return data;
  }
}

class DistrictAddressModel {
  int? id;
  String? sName;
  String? sPrefix;
  String? sProvinceId;

  DistrictAddressModel({this.id, this.sName, this.sPrefix, this.sProvinceId});

  DistrictAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['_name'];
    sPrefix = json['_prefix'];
    sProvinceId = json['_province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_name'] = this.sName;
    data['_prefix'] = this.sPrefix;
    data['_province_id'] = this.sProvinceId;
    return data;
  }
}
class WardAddressModel {
  int? id;
  String? sName;
  String? sPrefix;
  String? sProvinceId;
  String? sDistrictId;

  WardAddressModel(
      {this.id, this.sName, this.sPrefix, this.sProvinceId, this.sDistrictId});

  WardAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['_name'];
    sPrefix = json['_prefix'];
    sProvinceId = json['_province_id'];
    sDistrictId = json['_district_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_name'] = this.sName;
    data['_prefix'] = this.sPrefix;
    data['_province_id'] = this.sProvinceId;
    data['_district_id'] = this.sDistrictId;
    return data;
  }
}