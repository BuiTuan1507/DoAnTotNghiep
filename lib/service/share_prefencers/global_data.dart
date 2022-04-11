

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user/user_model.dart';
import '../../utils/utils.dart';

class GlobalData{
  static  UserModel _userModel =  UserModel();
  static  UserModel getUserModel() {
    if(_userModel.token == '' || _userModel.token == null){
      _userModel = UserModel();
    }
    return _userModel;
  }
  static setUserModel (UserModel userModel){
    _userModel = userModel;
  }
  static setImageUserModel(String image) {
    _userModel.avatar = image;
  }

  static void setUserLogin(UserModel? user) async{
    if(!CommonUtil.isEmpty(user)) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", user?.token ?? "");
      prefs.setString("username", user?.username?? "");
      prefs.setString("phoneNumber", user?.phoneNumber ?? "");
      prefs.setBool("active", user?.active ?? true);
      setUserModel(user ?? UserModel());
    }
  }

}
