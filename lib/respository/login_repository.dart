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

}