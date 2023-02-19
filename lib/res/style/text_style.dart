import 'package:flutter/material.dart';
import 'package:xflutter/res/dimens.dart';

import '../colors.dart';

class TextStyles {
  ///主要字体
  static const TextStyle primary = TextStyle(
      color: Colours.whiteColor, fontSize: Dimens.fontSp14);
  ///授权弹窗字体
  static TextStyle agreementTextStyle = TextStyle(
      color: Colours.agreementTextColor,
      fontSize: Dimens.fontSp14);
  ///授权弹窗字体--蓝色
  static TextStyle agreementTextBlueStyle = TextStyle(
      color: Colours.themeColorSupport.keys.toList()[0],
      fontSize: Dimens.fontSp14);
  ///输入框提示字符
  static const TextStyle hintStyle = TextStyle(
      color: Colours.inputHitTextColor,
      fontSize: Dimens.fontSp13);
  ///头部标题字体
  static const TextStyle headTextStyle = TextStyle(
      color: Colours.headTextColor, fontSize: Dimens.fontSp18);
  ///小号字体
  static const TextStyle smallSubTextStyle = TextStyle(
      color: Colours.inputHitTextColor,
      fontSize: Dimens.fontSp12);
  ///大号字体
  static const TextStyle bigTextStyle = TextStyle(
      color: Colours.textColor, fontSize: Dimens.fontSp22);
}
