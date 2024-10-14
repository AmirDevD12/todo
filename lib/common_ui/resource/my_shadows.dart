import 'package:flutter/material.dart';

class MyShadows {
  static const List<BoxShadow> light = [
    BoxShadow(
      color: Color(0x0a1b3276),
      spreadRadius: 0,
      blurRadius: 20,
      offset: Offset(0, 6), // changes position of shadow
    )
  ];
  static const List<BoxShadow> normal = [
    BoxShadow(
      color: Color(0x141b3276),
      spreadRadius: 0,
      blurRadius: 24,
      offset: Offset(0, 8), // changes position of shadow
    ),
  ];
  static const List<BoxShadow> heavy = [
    BoxShadow(
      color: Color(0x1f1b3276),
      spreadRadius: 0,
      blurRadius: 40,
      offset: Offset(0, 12), // changes position of shadow
    ),
  ];
  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color(0x0F1B3276),
      blurRadius: 3,
      offset: Offset(0, 2),
      spreadRadius: 0,
    )
  ];
}
