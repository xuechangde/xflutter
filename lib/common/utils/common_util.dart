import 'package:bot_toast/bot_toast.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../app_config.dart';
import '../constant.dart';

///公共方法类
class CommonUtils {
  ///获取图片路径
  static String getImgPath(String name) {
    return 'assets/images/$name';
  }

  ///获取设备型号
  static Future<String?> getDeviceModel() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model;
    }
  }

  ///获取app相关应用市场H5地址
  static String getAppUrl() {
    String downloadUrl = '';
    switch(AppConfig.channelName){
      case 'huawei':
        downloadUrl = Constant.huaweiAppUrl;
        break;
      case 'xiaomi':
        downloadUrl = Constant.xiaomiAppUrl;
        break;
      case 'oppo':
        downloadUrl = Constant.oppoAppUrl;
        break;
      case 'vivo':
        downloadUrl = Constant.vivoAppUrl;
        break;
      case 'yingyongbao':
        downloadUrl = Constant.yingyongbaoAppUrl;
        break;
      default:
        downloadUrl = Constant.vivoAppUrl;
        break;
    }
    return downloadUrl;
  }

  /// 退出 APP
  static void doQuit() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static DateTime? _lastTime; // 上次点击退出当前页面的时间
  ///点击两次退出APP
  static void doDoubleQuit() async {
    // 两秒内没有再点过退出按钮
    if (_lastTime == null || DateTime.now().difference(_lastTime!) > const Duration(seconds: 2)) {
      // 重置最后一次点击的时间
      _lastTime = DateTime.now();
      // 弹出吐司，需引入插件 bot_toast，当然其它的吐司插件也行
      BotToast.showText(text: "再按一次退出APP", align: Alignment.center);
    }
    // 两秒内点了两次退出按钮，则退出 APP
    else {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
}
