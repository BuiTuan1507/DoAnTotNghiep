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
    SexType(tittle: "Khác", isSelected: false),
  ];

  static List<SexType> listPriority = [
    SexType(tittle: "Tin ưu tiên", isSelected: false),
    SexType(tittle: "Tin bình thường", isSelected: false),
  ];
}