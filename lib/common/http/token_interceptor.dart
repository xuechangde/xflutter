import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:xflutter/common/common_index.dart';
import 'package:xflutter/common/global/global_bloc.dart';
import 'package:xflutter/common/http/request_api.dart';

const String _kTokenKey = 'Authorization';
const String _kTokenPrefix = 'Bearer ';
///排队拦截器
class TokenInterceptors<T> extends QueuedInterceptorsWrapper {
  TokenInterceptors();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ///判断token是否失效，失效重新请求token
    if (GlobalBloc.to.token != ''&&!JwtDecoder.isExpired(GlobalBloc.to.token)) {
      RestClient().getTestData(1).then((d) {
        SpService.to.setString(SpKeyConst.kAppToken, d.data['data']['token']);
        options.headers[_kTokenKey] = d.data['data']['token'];
        handler.next(options);
      }).catchError((error, stackTrace) {
        handler.reject(error, true);
      });
    }else{
      if (GlobalBloc.to.token.isNotEmpty) {
        options.headers[_kTokenKey] = '$_kTokenPrefix${GlobalBloc.to.token}';
      }
      return handler.next(options);
    }
  }
}