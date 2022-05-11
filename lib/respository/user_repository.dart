import '../config/config.dart';
import '../models/response_model.dart';
import '../utils/utils.dart';

class UserRepository{
  final BaseRequest _request = BaseRequest();

  Future<ResponseModel> apiGetUserInfo({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getUserInfo;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiSetUserInfo({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.setUserInfo;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiChangePassword({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.changePassword;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiAddAddress({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.addAddress;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiDeleteAddress({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.deleteAddress;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
}