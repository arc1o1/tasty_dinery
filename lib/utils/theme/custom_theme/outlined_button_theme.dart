import 'package:flutter/material.dart';

class CcOutlinedButtonTheme {
  // private constructor
  CcOutlinedButtonTheme._();

  //--------------------------- light theme ------------------------------------

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.blue,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  //---------------------------- dark theme ------------------------------------

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blueAccent),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
