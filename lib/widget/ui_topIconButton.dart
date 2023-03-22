import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/utils/tap_util.dart';
import '../res/dimens.dart';
import '../res/style/gaps.dart';
import '../res/style/text_style.dart';

class UiTopIconButton extends StatelessWidget{
  final double? iconSize;
  final Widget? verticalGap;
  final IconData iconData;
  final Color? iconColor;
  final Color? backgroundColor;
  final String textStr;
  final TextStyle? textStyle;
  final VoidCallback? voidCallback;
  const UiTopIconButton({super.key, this.iconSize, this.verticalGap,
    required this.iconData, this.iconColor, this.backgroundColor,
    required this.textStr, this.textStyle, this.voidCallback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDebounce(voidCallback),
      child: Column(
        children: [
          CircleAvatar(
            radius: iconSize??UiDimens.gapDp40,
            backgroundColor: backgroundColor??Get.theme.primaryColor,
            child: Icon(
              iconData,
              size: iconSize??UiDimens.gapDp40,
              color: Colors.white,
            ),
          ),
          verticalGap??UiGaps.vGap15,
          Text(textStr,
            style: textStyle??UiTextStyles.textBlack24Style,
          )
        ],
      ),
    );
  }
}