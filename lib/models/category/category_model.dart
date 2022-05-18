class MainCategory {
  int? id;
  String? sName;
  bool? isSelected;

  MainCategory({this.id, this.sName, this.isSelected});

  MainCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['_name'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_name'] = this.sName;
    return data;
  }
}

class SubCategory {
  int? id;
  String? sName;
  int? iMainId;
  bool? isSelected;

  SubCategory({this.id, this.sName, this.iMainId, this.isSelected});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['_name'];
    iMainId = json['_main_id'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_name'] = this.sName;
    data['_main_id'] = this.iMainId;
    return data;
  }
}
