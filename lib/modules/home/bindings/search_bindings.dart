import 'package:do_an/modules/home/controller/search_page_controller.dart';
import 'package:do_an/modules/home/page/search_page.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
    //  Get.lazyPut<LoginRepository>(() => LoginRepository());
    Get.lazyPut<SearchPage>(() => SearchPage());
  }

}