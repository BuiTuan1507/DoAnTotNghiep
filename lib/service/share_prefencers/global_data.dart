

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
      prefs.setString("id", user?.id.toString() ?? "");
      prefs.setString("avatar", user?.avatar?? "");
      prefs.setString("token", user?.token ?? "");
      prefs.setString("firstName", user?.firstName?? "");
      prefs.setString("lastName", user?.lastName?? "");
      prefs.setString("phoneNumber", user?.phoneNumber ?? "");
      prefs.setBool("active", user?.active ?? true);
      setUserModel(user ?? UserModel());
    }
  }
  static Future<void> clearUser () async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.remove("id");
    await _prefs.remove("avatar");
    await _prefs.remove("token");
    await _prefs.remove("firstName");
    await _prefs.remove("lastName");
    await _prefs.remove("phoneNumber");
    await _prefs.remove("active");
    setUserModel(UserModel());
  }
}
