import 'package:flutter/material.dart';

class MySpaces {
  static const double s0 = 0;
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s6 = 6;
  static const double s8 = 8;
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s60 = 60;
  static const double s64 = 64;
  static const double s68 = 68;
  // static double bottomSheetHeight = 85.h;
  // static double bottomSheetHeightMarginBottom = Platform.isIOS ? 5.h : 2.h;
}

class MyRadius {
  static const double xsNumber = 6;
  static const double smNumber = 10;
  static const double baseNumber = 16;
  static const double lgNumber = 24;
  static const double xlNumber = 32;
  static const double radiusSmooth = 1;

  static BorderRadius xs = BorderRadius.circular(MyRadius.xsNumber);
  static BorderRadius sm = BorderRadius.circular(MyRadius.smNumber);
  static BorderRadius base = BorderRadius.circular(MyRadius.baseNumber);
  static BorderRadius lg = BorderRadius.circular(MyRadius.lgNumber);
  static BorderRadius xl = BorderRadius.circular(MyRadius.xlNumber);

  static Radius xsRadius = const Radius.circular(MyRadius.xsNumber);
  static Radius smRadius = const Radius.circular(MyRadius.smNumber);
  static Radius baseRadius = const Radius.circular(MyRadius.baseNumber);
  static Radius lgRadius = const Radius.circular(MyRadius.lgNumber);
  static Radius xlRadius = const Radius.circular(MyRadius.xlNumber);
}
