class SetUserInfomation {
  String? firstName;
  String? lastName;
  String? email;
  String? birthDay;
  String? avatar;
  int? sexUser;

  SetUserInfomation(
      {this.firstName,
        this.lastName,
        this.email,
        this.birthDay,
        this.avatar,
        this.sexUser});

  SetUserInfomation.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    birthDay = json['birthDay'];
    avatar = json['avatar'];
    sexUser = json['sexUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['birthDay'] = this.birthDay;
    data['avatar'] = this.avatar;
    data['sexUser'] = this.sexUser;
    return data;
  }
}