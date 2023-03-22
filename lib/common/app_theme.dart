import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/sp_key.dart';
import 'global/global_bloc.dart';
import 'service/sp_service.dart';

///主题风格配置
class ThemeConfig {

  /// 用户选择的明暗模式
  static bool get _userDarkMode => SpService.to.getBool(SpKeyConst.kThemeColorIndex);

  static set _userDarkMode(bool value) {
    _userDarkMode = value;
  }

  /// 当前主题颜色
  static MaterialColor get _themeColor => GlobalBloc.to.themeColor;

  static set _themeColor(MaterialColor value){
    GlobalBloc.to.themeColor = value;
  }

  /// 切换指定色彩(Constant.themeColorSupport中提供几种主题色)
  void switchTheme({bool? darkMode, MaterialColor? color}) {
    _userDarkMode = darkMode ?? Get.isDarkMode;
    _themeColor = color ?? _themeColor;
    themeData(platformDarkMode:_userDarkMode);
    /// 主题类型
    Get.changeThemeMode(_userDarkMode?ThemeMode.dark:ThemeMode.light);
    ///样式设置
    Get.changeTheme(themeData(platformDarkMode:_userDarkMode));
    ///主题样式持久化到SP
    SpService.to.setBool(SpKeyConst.kThemeColorIndex, _userDarkMode);
    var index = Colors.primaries.indexOf(_themeColor);
    SpService.to.setInt(SpKeyConst.kThemeColorIndex, index);
  }

  /// 根据主题 明暗 和 颜色 生成对应的主题
  /// [dark]系统的Dark Mode
  static ThemeData themeData({bool platformDarkMode = false}) {
    var isDark = platformDarkMode || _userDarkMode;
    Brightness brightness = isDark ? Brightness.dark : Brightness.light;
    var themeColor = _themeColor;
    var accentColor = isDark ? themeColor[700] : _themeColor;
    var themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: themeColor,brightness: brightness,)
          .copyWith(secondary: accentColor),
    );
    themeData = themeData.copyWith(
      primaryColor: themeColor,
      appBarTheme: themeData.appBarTheme.copyWith(elevation: 0),
      splashColor: themeColor.withAlpha(50),
      highlightColor: themeColor.withAlpha(50),
      hintColor: themeData.hintColor.withAlpha(90),
      errorColor: Colors.red,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor:accentColor,
        selectionColor:accentColor?.withAlpha(60),
        selectionHandleColor:accentColor?.withAlpha(60),
      ),
      toggleableActiveColor: accentColor,
      chipTheme: themeData.chipTheme.copyWith(
        pressElevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        labelStyle: themeData.textTheme.caption,
        backgroundColor: themeData.chipTheme.backgroundColor?.withOpacity(0.1),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 14),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
    return themeData;
  }
}
