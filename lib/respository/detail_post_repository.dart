import '../config/config.dart';
import '../models/models.dart';
import '../utils/constants/enum.dart';

class DetailPostRepository {
  final BaseRequest _request = BaseRequest();


  Future<ResponseModel> apiGetDetailPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getDetailPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiReportPost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.reportPost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiFollowUser({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.followUser;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetListFriends({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getListFriends;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiGetAnotherUserInfo({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.getAnotherUserInfo;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiLikePost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.likePost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
  Future<ResponseModel> apiUnLikePost({required Map<String, dynamic> param,required String token}) async {
    var url = UrlApi.unlikePost;
    var res = await _request.requestBearerApi(
        method: MethodType.post, url: url, token: token,param: param);
    return res;
  }
}