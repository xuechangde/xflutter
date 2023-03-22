import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get_x;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:xflutter/common/common_index.dart';
import 'package:xflutter/common/http/request_interceptor.dart';
import 'package:xflutter/common/http/response_interceptor.dart';

import '../base/base_resp.dart';
import 'token_interceptor.dart';

/// 请求方法.
class Method {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  HttpConfig({
    this.options,
    this.pem,
    this.pKCSPath,
    this.pKCSPwd,
  });

  /// Options.
  BaseOptions? options;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PEM证书内容.
  String? pem;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书路径.
  String? pKCSPath;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书密码.
  String? pKCSPwd;
}
class DioUtil extends get_x.GetxService{
  static DioUtil get to => get_x.Get.find();
  late final Dio _dio;
  Future<DioUtil> init() async{
    _dio = Dio(_options);
    _dio.interceptors.add(RequestInterceptor());
    ///debug模式输入请求日志
    if(kDebugMode){
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    _dio.interceptors.add(ResponseInterceptor());
    return this;
  }

  ///获取dio
  Dio getDio(){
   return _dio;
  }

  /// create new dio.
  Dio createNewDio({BaseOptions? options}) {
    options = options ?? getDefOptions();
    Dio dio = Dio(options);
    if(kDebugMode){
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    return dio;
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.connectTimeout = const Duration(milliseconds: Constant.connectTimeout);
    options.receiveTimeout = const Duration(milliseconds: Constant.receiveTimeout);
    options.sendTimeout = const Duration(milliseconds: Constant.sendTimeout);
    return options;
  }

  /// Options.
  static final BaseOptions _options = getDefOptions();

  /// PEM证书内容.
  String? _pem;

  /// PKCS12 证书路径.
  String? _pKCSPath;

  /// PKCS12 证书密码.
  String? _pKCSPwd;

  ///token排队拦截器
  TokenInterceptors? tokenInterceptors;

  ///设置cookie
  void setCookie(String cookie) {
    Map<String, dynamic> headers = {};
    headers["Cookie"] = cookie;
    _dio.options.headers.addAll(headers);
  }

  ///排队拦截器，针对token失效时，请求新的token之后继续执行相关请求
  void setTokenInterceptors() {
    tokenInterceptors = TokenInterceptors();
    _dio.interceptors.add(tokenInterceptors!);
  }

  ///删除排队拦截器
  void deleteTokenInterceptors(){
    _dio.interceptors.remove(tokenInterceptors);
  }

  /// set Config.
  void setConfig(HttpConfig config) {
    _mergeOption(config.options!);
    _pem = config.pem ?? _pem;
    _dio.options = _options;
    if (_pem != null) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == _pem) {
            /// 证书一致，则放行
            return true;
          }
          return false;
        };
        return null;
      };
    }
    if (_pKCSPath != null) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        SecurityContext sc = SecurityContext();
        //file为证书路径
        sc.setTrustedCertificates(_pKCSPath!, password: _pKCSPwd);
        HttpClient httpClient = HttpClient(context: sc);
        return httpClient;
      };
    }
  }

  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  /// <BaseResp<T> 返回 status code msg data .
  Future<Response> handleResponse<T>(Response response) async {
    String rStatus;
    int rCode;
    String rMsg;
    T rData;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          rCode = (response.data[Constant.codeKey] is String)
              ? int.tryParse(response.data[Constant.codeKey])
              : response.data[Constant.codeKey];
          rMsg = response.data[Constant.messageKey];
          rData = response.data[Constant.dataKey];
        } else {
          Map<String, dynamic> dataMap = _decodeData(response);
          rCode = (dataMap[Constant.codeKey] is String)
              ? int.tryParse(dataMap[Constant.codeKey])
              : dataMap[Constant.codeKey];
          rMsg = dataMap[Constant.messageKey];
          rData = dataMap[Constant.dataKey];
        }
        response.data = BaseResp(rCode, rMsg, rData).toJson();
        return response;
      } catch (e) {
        return Future.error(DioError(
          requestOptions: response.requestOptions,
          response: response,
          message: Ids.dataParsingException.tr,
          type: DioErrorType.badResponse,
        ));
      }
    }
    return response;
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response.data == null ||
        response.data.toString().isEmpty) {
      return {};
    }
    return json.decode(response.data.toString());
  }

  /// merge Option.
  void _mergeOption(BaseOptions opt) {
    _options.method = opt.method;
    _options.headers = (Map.from(_options.headers))..addAll(opt.headers);
    _options.baseUrl = opt.baseUrl;
    _options.connectTimeout = opt.connectTimeout;
    _options.receiveTimeout = opt.receiveTimeout;
    _options.responseType = opt.responseType;
    _options.queryParameters = opt.queryParameters;
    _options.extra = (Map.from(_options.extra))..addAll(opt.extra);
    _options.contentType = opt.contentType ?? _options.contentType;
    _options.validateStatus = opt.validateStatus;
    _options.followRedirects = opt.followRedirects;
  }
}