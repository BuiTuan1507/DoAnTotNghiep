import 'package:get/get.dart';

import '../../../models/post/post_user_data_model.dart';
import '../../../models/response_model.dart';
import '../../../respository/post_repository.dart';
import '../../../service/share_prefencers/global_data.dart';
import '../../../utils/common/common_util.dart';

class SellOrderController extends GetxController{
  RxBool isLoading = false.obs;

  RxList<PostUserDataModel> listPostUserData = <PostUserDataModel>[].obs;

  PostRepository postRepository = PostRepository();


  @override
  void onInit() async {
    await getListPostBuy();
    super.onInit();
  }

  Future<void> getListPostBuy () async {
    try{
      isLoading.value = true;
      String token = GlobalData.getUserModel().token ?? "";
      int userId = GlobalData.getUserModel().id ?? 0;
      Map<String, dynamic> param = {
        "token": token,
        "userId": userId
      };
      ResponseModel responseModel = await postRepository.getListPostBuy(param: param, token: token);
      if(responseModel.status){
        dynamic data = responseModel.data;
        if(data.length > 0){
          for(var item in data){
            listPostUserData.add(PostUserDataModel.fromJson(item));
          }
        }

      }else{
        CommonUtil.showToast(responseModel.message);
      }
      isLoading.value = false;

    }
    catch(e){
      isLoading.value = false;

      CommonUtil.showToast("Lỗi lấy danh sách tin đã mua");
    }
  }
}