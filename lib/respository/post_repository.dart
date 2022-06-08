
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

  Future<ResponseModel> apiGetListPostPersonal({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListPostPersonal;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetListPostNoFilter({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListPostNoFilter;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetListPostFilter({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListPostFilter;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiSearchPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListPostSearch;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetListHistorySearch({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListHistorySearch;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> deleteHistorySearch({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.deleteHistorySearch;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> getSettingInfo({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getSettingInfo;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }



}