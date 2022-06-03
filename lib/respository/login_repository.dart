import '../config/config.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class LoginRepository {
  final BaseRequest _request = BaseRequest();

  Future<ResponseModel> apiLogin(Map<String, dynamic> param) async {
    var url = UrlApi.login;
    var res = await _request.requestApi(
        method: MethodType.post, url: url, param: param);
    return res;
  }

  Future<ResponseModel> apiLogout({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.logout;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiCheckToken({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.checkToken;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
}