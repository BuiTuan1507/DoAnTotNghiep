
import 'package:do_an/utils/common/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class AccountPage extends GetView<AccountController>{
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          InkWell(
            onTap: (){
controller.logout(context);
            },
            child: Container(
              height: width(30),
              width: width(30),
              child: Center(
                child: Text("Đăng xuất"),
              ),
            ),
          )
        ],
      ),
    );
  }

}
