
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class AccountPage extends GetView<AccountController>{
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Account"),
    );
  }

}
