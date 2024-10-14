import 'package:flutter/material.dart';
import 'package:todo/common_ui/resource/my_colors.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    textTheme: Typography()
        .white
        .apply(fontFamily: 'iran_yekan', bodyColor: MyColors.primary),
    primaryColor:  MyColors.primary,
  );
  static final dark = ThemeData.dark().copyWith(
    textTheme: Typography()
        .white
        .apply(fontFamily: 'iran_yekan', bodyColor: Colors.white),
    primaryColor: const Color(0xFF9583C5),
  );

  static final Map<String, Color> lightCustomColors = {
    'splashBackground': Colors.red,
  };

  static final Map<String, Color> darkCustomColors = {
    'splashBackground': Colors.red,

  };
}

extension ThemeExtension on ThemeData {
  Map<String, Color> get customColors {
    return brightness == Brightness.light
        ? AppTheme.lightCustomColors
        : AppTheme.darkCustomColors;
  }
  Color get splashBackground {
    return customColors['splashBackground'] ?? Colors.transparent;
  }
}
