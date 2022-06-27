class UserModel{
  int? idDb;
  int? id;
  String? firstName;
  String? lastName;
  String? token;
  String? avatar;
  bool? active;
  String? phoneNumber;
  UserModel(
      {this.idDb ,this.id, this.firstName,this.lastName, this.token, this.avatar, this.active,this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    idDb = json['idDb'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    token = json['token'];
    avatar = json['avatar'];
    active = json['active'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idDb'] = this.idDb;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['token'] = this.token;
    data['avatar'] = this.avatar;
    data['active'] = this.active;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}