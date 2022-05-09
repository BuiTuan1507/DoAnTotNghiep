class RegisterUserModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;
  int? sexUser;
  String? birthDay;

  RegisterUserModel(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.password,
        this.sexUser,
        this.birthDay});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    sexUser = json['sexUser'];
    birthDay = json['birthDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['sexUser'] = this.sexUser;
    data['birthDay'] = this.birthDay;
    return data;
  }
}
class RegisterSingleton{
  static RegisterUserModel? _registerUserModel;

  static getModel(){
    if(_registerUserModel?.firstName == null){
      return RegisterUserModel();
    }
    return _registerUserModel;
  }
  static setModel(RegisterUserModel registerUserModel){
    _registerUserModel = registerUserModel;
  }
}