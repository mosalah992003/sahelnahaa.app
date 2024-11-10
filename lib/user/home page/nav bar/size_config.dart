import 'package:flutter/material.dart';

class AppSizes {
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static void init(BuildContext context) {
    blockSizeHorizontal =
        MediaQuery.of(context).size.width / 100; // 1% of screen width
    blockSizeVertical =
        MediaQuery.of(context).size.height / 100; // 1% of screen height
  }
}
