import '../config/request.dart';
import '../config/url_api.dart';
import '../models/models.dart';
import '../utils/constants/enum.dart';

class ChatRepository {
  final BaseRequest _request = BaseRequest();


  Future<ResponseModel> apiAddChatRoom({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.addChatRoom;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiGetListChatRoom({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListChatRoom;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiSearchChatRoom({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.searchChatRoom;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiGetDetailChatRoom({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getDetailChatRoom;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetListMessage({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListMessage;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

  Future<ResponseModel> apiDeleteChatRoom({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.deleteChatRoom;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }

}