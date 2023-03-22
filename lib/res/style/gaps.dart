import 'package:flutter/cupertino.dart';

import '../../common/utils/screen_util.dart';

/// 间隔
class UiGaps {
  /// 水平间隔
  static Widget hGap5 =  SizedBox(width: W(5));
  static Widget hGap10 = SizedBox(width: W(10));
  static Widget hGap15 = SizedBox(width: W(15));
  static Widget hGap20 = SizedBox(width: W(20));
  static Widget hGap25 = SizedBox(width: W(25));
  static Widget hGap30 = SizedBox(width: W(30));
  static Widget hGap80 = SizedBox(width: W(80));

  /// 垂直间隔
  static Widget vGap5 = SizedBox(height: H(5));
  static Widget vGap10 = SizedBox(height: H(10));
  static Widget vGap15 = SizedBox(height: H(15));
  static Widget vGap20 = SizedBox(height: H(20));
  static Widget vGap25 = SizedBox(height: H(25));
  static Widget vGap30 = SizedBox(height: H(30));
  static Widget vGap50 = SizedBox(height: H(50));
  static Widget vGap80 = SizedBox(height: H(80));
  static Widget vGap130 = SizedBox(height: H(130));
}