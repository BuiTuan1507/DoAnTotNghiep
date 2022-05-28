import 'package:do_an/models/models.dart';
import 'package:do_an/models/post/detail_post_model.dart';
import 'package:do_an/respository/detail_post_repository.dart';
import 'package:do_an/utils/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../service/share_prefencers/global_data.dart';

class ReportPostController extends GetxController {
  RxBool isLoading = false.obs;

  final TextEditingController tittleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Rx<Post> repostPost = Post().obs;

  @override
  void onInit() {
    repostPost.value = Get.arguments;
    super.onInit();
  }

  DetailPostRepository detailPostRepository = DetailPostRepository();

  Future<void> addReportPost() async {
    if(tittleController.text.trim().isNotEmpty && contentController.text.trim().isNotEmpty){
      try {
        String token = GlobalData.getUserModel().token ?? "";
        int userId = GlobalData.getUserModel().id ?? 0;
        isLoading.value = true;
        Map<String, dynamic> param = {
          "token": token,
          "userId": userId,
          "idPost": 59,
          "subject":"Hello",
          "details":"1222332"
        };
        ResponseModel responseModel = await detailPostRepository.apiReportPost(param: param, token: token);
        if (responseModel.status) {
          CommonUtil.showToast("Bạn đã báo cáo bài đăng thành công", isSuccessToast: true);
        } else {
          CommonUtil.showToast(responseModel.message);
        }
      } catch (e) {
        CommonUtil.showToast("Lỗi thêm bài đăng");
      }
    }else{
      CommonUtil.showToast("Bạn cần điền đầy đủ thông tin");
    }

  }
}