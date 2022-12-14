import 'package:flutter/material.dart';

class AppColorStyle {
  static final AppColorStyle _instance = AppColorStyle._init();
  static AppColorStyle get instance => _instance;
  AppColorStyle._init();

  Color get brightGrey => const Color.fromRGBO(243, 244, 246, 1);
  Color get snowPea => const Color.fromRGBO(102, 204, 120, 1);
  Color get samphireGreen => const Color.fromRGBO(77, 174, 94, 1);
  Color get bouncyBallGreen => const Color.fromRGBO(72, 171, 89, 1);
  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get twinkleBlue => const Color.fromRGBO(207, 212, 222, 1);
  Color get darkKnight => const Color.fromRGBO(20, 28, 45, 1);
  Color get red => const Color.fromRGBO(246, 73, 73, 1);
  Color get lightRed => const Color.fromRGBO(255, 246, 246, 1);
}
