import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/colors.dart';

class CcShadowStyle {
  // vertical
  static final verticalProductShadow = BoxShadow(
    color: CcColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 10,
    offset: const Offset(0, 2),
  );

  // horizontal
  static final horizontalProductShadow = BoxShadow(
    color: CcColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 10,
    offset: const Offset(0, 2),
  );
}
