import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:xflutter/common/common_index.dart';
import 'package:xflutter/common/base/base_resp.dart';

part 'request_api.g.dart'; //必须配置，否则无法生成.g文件

///cmd:flutter packages pub run build_runner build --delete-conflicting-outputs  一次构建
///cmd:flutter packages pub run build_runner watch --delete-conflicting-outputs  修改完成后，ctrl+s保存，实时构建

///调用自己的服务器地址使用
RestClient requestClient = RestClient(
    dio: DioUtil.to.getDio(), baseUrl: Constant.baseUrl);
///调用第三方平台的服务器地址
RestClient requestClientOther = RestClient(
    dio: DioUtil.to.createNewDio(),
    baseUrl: "http://jsonplaceholder.typicode.com");

@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient({Dio? dio, String? baseUrl}) {
    return _RestClient(dio??DioUtil.to.getDio(), baseUrl: baseUrl);
  }

  @GET("app/{id}")
  Future<BaseResp?> getToken(@Path() int id);

  @GET("/posts/{no}")
  Future getTestData(@Path() int no);
}
