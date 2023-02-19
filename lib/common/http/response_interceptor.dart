import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:xflutter/common/common_index.dart';

import 'base_resp.dart';

class ResponseInterceptor extends Interceptor{
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    DioUtil.to.handleResponse(response).then((value){
      if(value.data[Constant.codeKey] == null || value.data[Constant.codeKey]!=Constant.statusSuccess){
        if(value.data[Constant.messageKey] != null&&value.data[Constant.messageKey].toString().isNotEmpty){
          handler.reject(DioError(response: value, requestOptions: response.requestOptions,message: value.data[Constant.messageKey]), true);
        }else{
          value.data['message'] = "unknown error...";
          handler.reject(DioError(response: value, requestOptions: response.requestOptions,message: "unknown error..."), true);
        }
      }else{
        return handler.next(value);
      }
    }).catchError((error){
      handler.reject(error, true);
    });
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    BotToast.showText(text: fromDioError(err),align: const Alignment(0, 0.6));
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
          /// http错误码带业务错误信息
          BaseResp apiResponse = BaseResp.fromJson(error.response?.data);
          if(apiResponse.code != null){
            return "${apiResponse.msg},${Ids.errorCode.tr}:${apiResponse.code}";
          }
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 200:
              return Ids.dataParsingException.tr;
            case 201:
              return Ids.dataParsingException.tr;
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