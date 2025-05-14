import 'package:flutter/material.dart';

class SizeController {
  static double? screenHeight;
  static double? screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }
}
