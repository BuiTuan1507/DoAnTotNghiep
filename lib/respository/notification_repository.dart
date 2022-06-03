import '../config/config.dart';
import '../models/response_model.dart';
import '../utils/constants/enum.dart';

class NotificationRepository{
  final BaseRequest _request = BaseRequest();

  Future<ResponseModel> apiExtendPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.extendPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiCancelPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.cancelPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiBuyPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.buyPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiSellPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.sellPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiRatingPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.ratingPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetListNotification({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListNotificationPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> readingNotification({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.readNotification;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
}