import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors.dart';
import '../dimens.dart';

class UiTextStyles {
  ///主要字体
  static TextStyle primary = TextStyle(
      color: UiColors.textColor, fontSize: UiDimens.fontSp28);
  ///授权弹窗字体
  static TextStyle agreementTextStyle = TextStyle(
      color: UiColors.agreementTextColor,
      fontSize: UiDimens.fontSp26);
  ///授权弹窗字体--蓝色
  static TextStyle agreementTextBlueStyle = TextStyle(
      color: UiColors.themeColorSupport.keys.toList()[0],
      fontSize: UiDimens.fontSp26);
  ///输入框提示字符
  static TextStyle hint26Style = TextStyle(
      color: UiColors.inputHitTextColor,
      fontSize: UiDimens.fontSp26);
  ///提示字体hint24sp
  static TextStyle hint24Style = TextStyle(
      color: UiColors.inputHitTextColor,
      fontSize: UiDimens.fontSp24);
  ///提示字体hint22sp
  static TextStyle hint22Style = TextStyle(
      color: UiColors.inputHitTextColor,
      fontSize: UiDimens.fontSp22,fontWeight: FontWeight.w400);
  ///输入框字体
  static TextStyle inputTextStyle = TextStyle(
      color: UiColors.textColor,
      fontSize: UiDimens.fontSp26);
  ///主题26sp字体
  static TextStyle buttonTextTheme26Style = TextStyle(
      color: Get.theme.primaryColor,
      fontSize: UiDimens.fontSp26);
  ///白色26sp字体
  static TextStyle buttonTextWhite26Style = TextStyle(
      color: Colors.white,
      fontSize: UiDimens.fontSp26);
  ///白色28sp字体
  static TextStyle textWhite28Style = TextStyle(
      color: Colors.white,
      fontSize: UiDimens.fontSp28);
  ///主题22sp字体
  static TextStyle textTheme22Style = TextStyle(
      color: Get.theme.primaryColor,
      fontSize: UiDimens.fontSp22);
  ///主题24sp字体
  static TextStyle textTheme24Style = TextStyle(
      color: Get.theme.primaryColor,
      fontSize: UiDimens.fontSp24);
  ///黑色22sp字体
  static TextStyle textBlack22Style = TextStyle(
      color: UiColors.textColor,
      fontSize: UiDimens.fontSp22);
  ///黑色24sp字体
  static TextStyle textBlack24Style = TextStyle(
      color: UiColors.textColor,
      fontSize: UiDimens.fontSp24);
  ///黑色28sp字体
  static TextStyle textBlack28Style = TextStyle(
      color: UiColors.textColor,
      fontSize: UiDimens.fontSp28);
  ///头部标题字体
  static TextStyle headText36Style = TextStyle(
      color: UiColors.headTextColor, fontSize: UiDimens.fontSp36);
  ///头部标题字体白色
  static TextStyle headTextWhite36Style = TextStyle(
      color: Colors.white, fontSize: UiDimens.fontSp36);
  ///小号字体
  static TextStyle smallSubText16Style = TextStyle(
      color: UiColors.inputHitTextColor,
      fontSize: UiDimens.fontSp16);
  ///大号字体
  static TextStyle bigText36Style = TextStyle(
      color: UiColors.textColor, fontSize: UiDimens.fontSp36);
}