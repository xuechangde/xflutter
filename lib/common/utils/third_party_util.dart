import 'package:flutter_xupdate/flutter_xupdate.dart';
import 'package:get/get.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';

import '../app_config.dart';
import '../global/global_bloc.dart';

class ThirdPartyUtil{
  ///初始化第三方相关
  static void initThirdSdk() async{
    ///FlutterXUpdate版本更新
    if (GetPlatform.isAndroid) {
      FlutterXUpdate.init(
        ///是否输出日志
          debug: true,
          ///是否使用post请求
          isPost: false,
          ///post请求是否是上传json
          isPostJson: false,
          ///请求响应超时时间
          timeout: 25000,
          ///是否开启自动模式
          isWifiOnly: false,
          ///是否开启自动模式
          isAutoMode: false,
          ///需要设置的公共参数
          supportSilentInstall: false,
          ///在下载过程中，如果点击了取消的话，是否弹出切换下载方式的重试提示弹窗
          enableRetry: false
      ).then((value) {
        Get.printInfo(info: "初始化成功: $value");
      }).catchError((error) {
        Get.printInfo(info: "初始化失败: $error");
      });

      FlutterXUpdate.setErrorHandler(
          onUpdateError: (Map<String, dynamic>? message) async {
            Get.printInfo(info: "初始化回调消息: $message");
          });
    } else {
      Get.printInfo(info: "ios暂不支持XUpdate更新");
    }
    ///fluwx
    //registerWxApi(appId: AppConfig.wxAppId, universalLink: AppConfig.universalLink);
    if (GlobalBloc.to.isAgreePrivacy) {
      ///友盟
      await UmengCommonSdk.initCommon(AppConfig.umAndroidAppKey,AppConfig.umIosAppKey,AppConfig.channelName);
      UmengCommonSdk.setPageCollectionModeManual();
    }
  }
}