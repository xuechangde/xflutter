import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CommonUtils {
  ///获取图片路径
  static String getImgPath(String name) {
    return 'assets/images/$name';
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
