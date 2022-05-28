import 'package:do_an/modules/product_detail/controller/report_post_controller.dart';
import 'package:get/get.dart';

import '../page/report_post_page.dart';


class ReportPostBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReportPostController>(() => ReportPostController());

    Get.lazyPut<ReportPostPage>(() => ReportPostPage());
  }

}