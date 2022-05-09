import 'package:do_an/modules/account/controller/friend_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class FriendUserPage extends GetView<FriendUserController>{
  const FriendUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          centerTitle: true,
          title: Text(
            "Bạn bè",
            style: AppStyles.textNormalWhiteSemiBold,
          ),
          automaticallyImplyLeading: true,
          backgroundColor: greenMoney,
        )
    );
  }

}