import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///flutter与原生方法交互
class MethodChannelUtil{
  static const MethodChannel _channel = MethodChannel('native/method');
  ///获取渠道来源名称
  static Future<String> getChannelName() async {
    String? deviceName = await _channel.invokeMethod('getChannelName');
    return deviceName ?? "unknown";
  }
  ///flutter方法，提供给原生调用
  static Future<dynamic> flutterMethod(MethodCall methodCall) async{
    switch (methodCall.method) {
      case 'test':
        if (kDebugMode) {
          print('原生Android传递给flutter的参数是：${methodCall.arguments}');
        }
        break;
    }
  }
}