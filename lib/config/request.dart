
import 'dart:developer';

import 'package:dio/dio.dart' as Di;
import 'package:dio/dio.dart';
import 'package:do_an/config/url_api.dart';

import '../models/response_model.dart';
import '../utils/utils.dart';


Map<MethodType, String> methods = {
  MethodType.get: "GET",
  MethodType.post: "POST",
  MethodType.patch: "PATCH",
  MethodType.delete: "DELETE",
};

class BaseRequest {
  Dio _dio = Dio();

  BaseRequest({String? base}) {
    base ??= appEnvironment.domainApi;
    _dio = Dio(
      BaseOptions(
        baseUrl: base,
        receiveTimeout: appEnvironment.receiveTimeout,
        connectTimeout: appEnvironment.connectTimeout,
        contentType: Constants.contentType,
      ),
    );
  }

  Future<ResponseModel> requestApi({
    required MethodType method,
    required String url,
    Map<String, dynamic>? param,
    Map<String, dynamic>? header,
  }) async {
    log("URL: " + url + "\n");
    log("body: " + param.toString());
    header ??= {};
    try {
      var response = await _dio.request(
        url,
        data: param,
        options: Options(method: methods[method], headers: header),
      );
      log("Response: " + response.toString());
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      return handleError(e);
    }
  }

  Future<ResponseModel> requestBearerApi({
    required MethodType method,
    required String url,
    Map<String, dynamic>? param,
    required String token,
  }) async {
    log("URL: " + url + "\n");
    log("body: " + param.toString());
    Map<String, dynamic> header = {};
    header["authorization"] = token;
    try {
      var response = await _dio.request(
        url,
        data: param,
        options: Options(method: methods[method], headers: header),
      );
      log("Response: " + response.toString());
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());

      return handleError(e);
    }
  }


  Future<ResponseModel> handleError(dynamic error) async {
    try {
      ResponseModel errorModel = ResponseModel();
      errorModel.message = error.toString();
      if (error is String) {
        errorModel.message = "html";
        return errorModel;
      }
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.sendTimeout:
            errorModel.message = Constants.requestSendTimeout;
            break;
          case DioErrorType.connectTimeout:
            errorModel.message = Constants.requestConnectTimeout;
            break;
          case DioErrorType.receiveTimeout:
            errorModel.message = Constants.requestReceiveTimeout;
            break;
          case DioErrorType.cancel:
            errorModel.message = Constants.requestCancelled;
            break;
          case DioErrorType.other:
            errorModel.message = Constants.noInternet;
            break;
          case DioErrorType.response:
            errorModel.errorCode =
                error.response!.statusCode ?? errorModel.errorCode;
            errorModel.message = error.response!.data ?? errorModel.message;
        }
      }

      return errorModel;
    } catch (e) {
      return ResponseModel();
    }
  }

}
