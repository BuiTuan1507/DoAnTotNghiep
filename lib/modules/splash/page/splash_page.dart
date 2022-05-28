import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/config.dart';
import '../../../models/user/user_model.dart';
import '../../../service/service.dart';
import '../../../utils/utils.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key) {
    fetchSomething();
  }

  void fetchSomething() async {
    //TODO Call API from server and do sth
    await Future.delayed(const Duration(seconds: 2));
    checkLogin();
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uuid = prefs.getString("id") ?? '';
    if (uuid == '') {
      Get.offAllNamed(RouterLink.login);
    } else {
      int id = int.parse(prefs.getString("id") ?? "0") ;
      String token = prefs.getString("token") ?? "";
      String firstName = prefs.getString("firstName") ?? "";
      String lastName = prefs.getString("lastName") ?? "";
      String avatar = prefs.getString("avatar") ?? "";
      String phoneNumber = prefs.getString("phoneNumber") ?? "";
      bool  active = false;

      UserModel newUser = UserModel(
          id: id,
          token: token,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
          active: active,
          phoneNumber: phoneNumber
      );
      GlobalData.setUserLogin(newUser);
      Get.offAllNamed(RouterLink.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: greenMoney),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Center(
                  child: Container(
                    width: width(268.0),
                    height: 268.0,
                    decoration:   BoxDecoration(
                      image: DecorationImage(image: AssetImage(MyImage.logo),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(width(10)),
                    child: Text(
                      'Create by Bui Minh Tuan',
                      style: GoogleFonts.sarabun(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
