import 'package:do_an/config/config.dart';
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

  RxInt reportPost = 0.obs;

  @override
  void onInit() {
    if(Get.arguments != null){
      reportPost.value = Get.arguments;
    }
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
          "idPost": reportPost.value,
          "subject": tittleController.text.trim(),
          "details":contentController.text.trim()
        };
        isLoading.value = true ;
        ResponseModel responseModel = await detailPostRepository.apiReportPost(param: param, token: token);
        tittleController.clear();
        contentController.clear();
        if (responseModel.status) {
          CommonUtil.showToast("Bạn đã báo cáo bài đăng thành công", isSuccessToast: true);
          Get.back();
        } else {
          CommonUtil.showToast(responseModel.message);
        }
        isLoading.value = false ;
      } catch (e) {
        isLoading.value = false ;
        CommonUtil.showToast("Lỗi thêm bài đăng");
      }
    }else{
      CommonUtil.showToast("Bạn cần điền đầy đủ thông tin");
    }

  }
}