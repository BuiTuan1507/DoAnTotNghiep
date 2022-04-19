class SexType {
  String? tittle;
  bool? isSelected;

  SexType({this.tittle, this.isSelected});

  SexType.fromJson(Map<String, dynamic> json) {
    tittle = json['tittle'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['tittle'] = tittle;
    data['isSelected'] = isSelected;
    return data;
  }
  static List<SexType> listSexType = [
    SexType(tittle: "Nam", isSelected: false),
    SexType(tittle: "Nữ", isSelected: false),
    SexType(tittle: "Tuỳ chọn khác", isSelected: false),
  ];
}