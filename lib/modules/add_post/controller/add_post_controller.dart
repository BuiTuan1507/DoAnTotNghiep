import 'package:do_an/models/category/category_model.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController{
  RxList<CategoryModel> listCategory = CategoryModel.listCategory.obs;

}