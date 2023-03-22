import 'package:flutter/material.dart';
import '../colors.dart';
import '../dimens.dart';

class UiDecorations {
  static const Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: UiColors.divider)));

  static Decoration whiteShadow = BoxDecoration(
      border:
      Border.all(color: UiColors.borderTran6, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(UiDimens.gapDp8)),
      boxShadow: UiColors.blackShadow,
      color: Colors.white);

  static Decoration padding4BlackTran40 = BoxDecoration(
      color: UiColors.blackTran40,
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      border: Border.all(
          width: 0.33, color: UiColors.divider));
}