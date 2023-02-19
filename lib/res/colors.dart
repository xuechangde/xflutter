import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Colours{
  /// 主色
  static final themeColorSupport = <MaterialColor, String>{
    Colors.blue: "冷漠之蓝",
    Colors.indigo: "无限之靛",
    Colors.red: "毁灭之红",
    Colors.orange: "愤怒之橙",
    Colors.yellow: "警告之黄",
    Colors.green: "伪装之绿",
    Colors.purple: "神秘之紫",
    const MaterialColor(0xff2D2D2D, <int, Color>{
      50: Color(0xFF8A8A8A),
      100: Color(0xFF747474),
      200: Color(0xFF616161),
      300: Color(0xFF484848),
      400: Color(0xFF3D3D3D),
      500: Color(0xff2D2D2D),
      600: Color(0xFF252525),
      700: Color(0xFF141414),
      800: Color(0xFF050505),
      900: Color(0xff000000),
    }): "归宿之黑"
  };

  static get buttonBg {
    return ColorConfig.getColor(ColorConfig.buttonBgKey);
  }
  static const Color divider = Color(0xffe5e5e5);
  static const Color blackTran40 = Color(0x66000000);
  // 文字相关
  static Color? agreementTextColor = Colors.grey[600];
  static const Color inputBorderColor = Color(0xffD0D7DD);
  static const Color textColor = Color(0xff323C47);
  static const Color inputHitTextColor = Color(0xff939EA7);
  static const Color headTextColor = Color(0xff666666);
  ///蓝色
  static const Color blueColor = Color(0xFF2268F2);
  ///白色
  static const Color whiteColor = Color(0xFFFFFFFF);
}

/// 颜色类适配黑暗模式
/// 适配黑暗模式步骤 添加之前可先查看是否已经添加该样式
/// 1 ColorConfig类中添加颜色key， 例 static const String bg_key = 'color_key';
/// 2 ColorUnit类中的_colors集合中添加颜色key-value
///   例：button_bg_key: [ColorUnit.white_color, ColorUnit.blue_color],
///   key:bg_key是步骤1添加的key, value:数组 两个颜色值，0是正常模式颜色，1是黑暗模式颜色
class ColorConfig {
  /// 颜色key
  static const String buttonBgKey = 'button_bg';
  /// 颜色值
  static const _colors = {
    buttonBgKey: [Colours.whiteColor, Colours.blueColor]
  };

  /// 取颜色值
  static Color getColor(String key) {
    final colors = _colors[key]!;
    if (Get.isDarkMode) {
      if (colors.length == 2) {
        return colors[1];
      } else {
        return colors[0];
      }
    } else {
      return colors[0];
    }
  }
}

