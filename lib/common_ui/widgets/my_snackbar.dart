
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';
import 'package:todo/common_ui/theme/theme_service.dart';


class MySnackBar {
  bool isDark = ThemeService().theme.name == "dark" ? true : false;
  static void show(String title, String body) {
    Get.snackbar("", "",
        padding: const EdgeInsets.symmetric(vertical: MySpaces.s16, horizontal: MySpaces.s8),
        titleText: Text(
          title,
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
          style: TextMediumStyle.lg.copyWith(
            color: MyColors.grey.shade700
          ),
        ),
        borderRadius: 16,
        snackbarStatus: (status) {
          print(status);
        },
        messageText: Text(
          body,
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
          style: TextMediumStyle.md.copyWith(
              color: MyColors.grey.shade700
          ),
        )
    );
  }
}
