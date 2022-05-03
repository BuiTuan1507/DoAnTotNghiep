import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/config.dart';
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
    String uuid = prefs.getString("uid") ?? '';
    if (uuid == '') {
      Get.offAllNamed(RouterLink.main);
    } else {
    //  String name = prefs.getString(LocaleKeys.nameUser) ?? "";
   //   String email = prefs.getString(LocaleKeys.emailUser) ?? "";
    //  String ccCurrency = prefs.getString(LocaleKeys.currency) ?? "";

    //  UserModel userModel = UserModel(uuid: uuid, name: name, email: email,ccCurrency: ccCurrency);
     // DataGlobal.setUserModel(userModel);
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
