import 'package:flutter/cupertino.dart';

class AppSizes {
  static late double wRatio;
  static late double hRatio;
<<<<<<< HEAD
  static late double padding36;
  static late double padding38;

=======

  static late double padding36;
  static late double padding38;

  static var bottomNavBarWidth;

  static var bottomNavBarHeight;

>>>>>>> origin/main
  static void init(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    wRatio = size.width / 430;
    hRatio = size.height / 932;
    padding36 = 36 * wRatio;
    padding38 = 38 * wRatio;
  }
}
