import 'package:flutter/foundation.dart';

class Constant {
  static String get baseUrl{
    if(kDebugMode){
      return '';
    }else{
      return '';
    }
  }
  ///判断该URL是否是校验返回参数，例如成功状码有多个的接口 ['app/getSmsCode']
  static bool isCheckUrl(String url){
    List<String> urlList = [];
    return urlList.where((element) => url.contains(element)).toList().isEmpty;
  }
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
  static const int statusSuccess = 0;
  static const String codeKey = 'code';
  static const String messageKey = 'message';
  static const String dataKey = 'data';
  ///微信fluwx相关操作返回码
  static const int wxLoginSuccess = 0;
  static const int wxLoginRefused = -4;
  static const int wxLoginCancel = -2;
  static String checkApkVersion = "";
  ///用户协议
  static const String userAgreement = '';
  ///隐私协议
  static const String privacyAgreement = '';
  ///华为应用市场AppH5地址
  static const String huaweiAppUrl = '';
  ///小米应用市场AppH5地址
  static const String xiaomiAppUrl = '';
  ///OPPO应用市场AppH5地址
  static const String oppoAppUrl = '';
  ///VIVO应用市场AppH5地址
  static const String vivoAppUrl = '';
  ///应用宝AppH5地址
  static const String yingyongbaoAppUrl = '';
  ///广告图加载地址
  static const String splashImgUrl = 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252Fdingyue.ws.126.net%252F2021%252F0623%252Fe8778436j00qv4pxx002mc000hs012ic.jpg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658781357&t=c3bc9dffaa8e6584139dbbf1deeb4f1d';
}