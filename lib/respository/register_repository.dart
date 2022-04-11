import '../config/config.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class RegisterRepository {
  final BaseRequest _request = BaseRequest();

  Future<ResponseModel> apiRegister(Map<String, dynamic> param) async {
    var url = UrlApi.register;
    var res = await _request.requestApi(
        method: MethodType.post, url: url, param: param);
    return res;
  }
}