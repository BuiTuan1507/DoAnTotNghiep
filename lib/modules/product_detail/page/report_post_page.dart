import 'package:do_an/modules/product_detail/controller/report_post_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/app_styles.dart';

class ReportPostPage extends GetView<ReportPostController>{
  const ReportPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title:Text("Báo cáo bài đăng", style: AppStyles.textNormalWhiteSemiBold),
        backgroundColor: greenMoney,
      ),
    );
  }

}