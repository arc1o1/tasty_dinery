// contsins list of all colors implemented in this project

import 'package:flutter/material.dart';

class CcColors {
  // private constructor
  CcColors._();

  // app basic colors
  static const Color primary = Color(0xFF4868FF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFB0C7FF);

  // app text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C758D);
  static const Color textWhite = Colors.white;

  // app background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // app background container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = CcColors.textWhite.withOpacity(0.1);

  // app button colors
  static const Color buttonPrimary = Color(0xFF4B68FF);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // app border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // app error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E36);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // app  neutral shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
