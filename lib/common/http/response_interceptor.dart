import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:xflutter/common/common_index.dart';

import '../base/base_resp.dart';

class ResponseInterceptor extends Interceptor{
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    DioUtil.to.handleResponse(response).then((value) {
      printInfo(info:Constant.isCheckUrl(value.requestOptions.uri.toString()).toString());
      BaseResp baseResp = BaseResp.fromJson(value.data);
      if ((baseResp.code == null ||
          baseResp.code != Constant.statusSuccess) &&
          Constant.isCheckUrl(value.requestOptions.uri.toString())) {
        if (baseResp.msg != null && baseResp.msg!.isNotEmpty) {
          handler.reject(
              DioError(
                  response: value,
                  type: DioErrorType.badResponse,
                  requestOptions: value.requestOptions,
                  message: baseResp.msg),
              true);
        } else {
          handler.reject(
              DioError(
                  response: value,
                  type: DioErrorType.badResponse,
                  requestOptions: value.requestOptions,
                  message: Ids.unknownError.tr),
              true);
        }
      } else {
        return handler.next(value);
      }
    }).catchError((error) {
      handler.reject(error, true);
    });
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    EasyLoading.showError(fromDioError(err));
    return;
  }

  ///处理错误信息
  String fromDioError(DioError error) {
    if (error.error is SocketException) {
      return Ids.networkConnectionException;
    }
    switch (error.type) {
      case DioErrorType.cancel:
        return Ids.requestCancel.tr;
      case DioErrorType.connectionTimeout:
        return Ids.connectionTimeout.tr;
      case DioErrorType.sendTimeout:
        return Ids.sendTimeout.tr;
      case DioErrorType.receiveTimeout:
        return Ids.receiveTimeout.tr;
      case DioErrorType.unknown:
        return Ids.unknownError.tr;
      case DioErrorType.badResponse:
        try {
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 200:
              return error.message!;
            case 201:
              return error.message!;
            case 400:
              return Ids.errorCode400.tr;
            case 401:
              return Ids.errorCode401.tr;
            case 403:
              return Ids.errorCode403.tr;
            case 404:
              return Ids.errorCode404.tr;
            case 405:
              return Ids.errorCode405.tr;
            case 500:
              return Ids.errorCode500.tr;
            case 502:
              return Ids.errorCode502.tr;
            case 503:
              return Ids.errorCode503.tr;
            case 505:
              return Ids.errorCode505.tr;
            default:
              return error.response?.statusMessage ?? Ids.unknownError.tr;
          }
        } on Exception catch (e) {
          return Ids.unknownError.tr;
        }
      default:
        return error.message??Ids.unknownError.tr;
    }
  }
}