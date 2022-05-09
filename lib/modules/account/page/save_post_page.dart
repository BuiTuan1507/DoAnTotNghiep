import 'package:do_an/modules/account/controller/save_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/app_styles.dart';

class SavePostPage extends GetView<SavePostController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "Lưu tin",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
    );
  }

}