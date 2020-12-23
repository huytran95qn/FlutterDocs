import 'package:flutter/material.dart';

class Utils {
  Utils._();

  /// Construct a color from a hex code string, of the format #RRGGBB.
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}