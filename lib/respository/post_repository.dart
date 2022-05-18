
import '../config/config.dart';

import '../models/models.dart';
import '../utils/constants/enum.dart';

class PostRepository{
  final BaseRequest _request = BaseRequest();

  Future<dynamic> apiGetListMainCategory() async {
    var url = UrlApi.getListMainCategory;
    var res = await _request.requestDataApi(
        method: MethodType.post, url: url);
    return res;
  }
  Future<dynamic> apiGetListSubCategory({required Map<String, dynamic> param}) async {
    var url = UrlApi.getListSubcategory;
    var res = await _request.requestDataApi(
        method: MethodType.post, url: url, param: param);
    return res;
  }
  Future<ResponseModel> apiAddPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.addPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

}