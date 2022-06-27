import 'package:do_an/models/user/user_model.dart';
import 'package:get/get.dart';

import '../../../service/service.dart';

class SaveAccountController extends GetxController {

  RxBool isLoading = false.obs;

  RxList<UserModel> listUser = <UserModel>[].obs;

  @override
  void onInit() async {
    await getListUser();
    super.onInit();
  }

  Future<List<Map<String, dynamic>>> getItemData() async {
    List<Map<String, dynamic>> _data = [];
    try {
      isLoading.value = true;
      _data = await MoneyManageDB.getItems();
      isLoading.value = false;
    } catch (e) {
      //throw error
      print(e.toString());
      isLoading.value = false;
    }
    return _data;
  }

  Future<void> getListUser() async {
    List<Map<String, dynamic>> _data = await getItemData();
    if (_data.isNotEmpty) {
      listUser.value =
      List<UserModel>.from(_data.map((model) => UserModel.fromJson(model)));
    }
  }
}