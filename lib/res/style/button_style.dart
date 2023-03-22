import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dimens.dart';

class UiButtonStyle{
  static ButtonStyle themeButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Get.theme.primaryColor,
    padding: EdgeInsets.symmetric(
        horizontal: UiDimens.gapDp15,vertical: UiDimens.gapDp20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(UiDimens.gapDp8))),
  );
  static ButtonStyle whiteButtonSideStyle = TextButton.styleFrom(
    foregroundColor: Get.theme.primaryColor, backgroundColor: Colors.white,
    side: BorderSide(width: 1,color: Get.theme.primaryColor),
    padding: EdgeInsets.symmetric(
        horizontal: UiDimens.gapDp15,vertical: UiDimens.gapDp20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(UiDimens.gapDp8))),
  );
  static ButtonStyle themeButtonCircleStyle = TextButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Get.theme.primaryColor,
    shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(100.0))),
    padding: EdgeInsets.symmetric(
        horizontal: UiDimens.gapDp15,vertical: UiDimens.gapDp20),
  );
}