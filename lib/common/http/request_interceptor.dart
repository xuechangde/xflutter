import 'package:dio/dio.dart';
import 'package:xflutter/common/app_config.dart';
import 'package:xflutter/common/common_index.dart';

class RequestInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    ///请求拦截，在此设置项目相应header参数，如appId、签名、版本、渠道之类，根据自身项目修改或自行增减
    String dateStr = DateUtil.formatDate(DateTime.now(), format: DateFormats.ymodhms);
    options.headers['appId'] = AppConfig.appId;
    options.headers['sessionKey'] = AppConfig.appSessionKey;
    options.headers['timestamp'] = dateStr;
    options.headers['sign'] = getSignStr(options,dateStr);
    options.headers['ver'] = AppConfig.versionName;
    options.headers['channel'] = AppConfig.channelName;
    super.onRequest(options, handler);
  }

  ///按照自定义规则加密签名
  String getSignStr(RequestOptions options, String time){
    String md5sign = "";
    ///在此实现相关逻辑
    ///
    md5sign = EncryptUtil.encodeMd5(md5sign);
    return md5sign;
  }
}


