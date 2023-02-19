import 'package:flutter/cupertino.dart';
import '../colors.dart';

class Decorations {
  static const Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider)));

  static Decoration padding4BlackTran40 = BoxDecoration(
      color: Colours.blackTran40,
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      border: Border.all(
          width: 0.33, color: Colours.divider));
}