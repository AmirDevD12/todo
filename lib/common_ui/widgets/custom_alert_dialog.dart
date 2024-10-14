import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

import '../resource/my_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.okLabel,
    required this.cancelLabel,
  });

  final String title;
  final String message;
  final String okLabel;
  final String cancelLabel;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isAndroid) {
      return AlertDialog(
        backgroundColor: MyColors.white,
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(foregroundColor: MyColors.error[700]),
            child: Text(
              cancelLabel,
              style: TextRegularStyle.lg,
            ),
          ),
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(foregroundColor: MyColors.primary),
            child: Text(
              okLabel,
              style: TextRegularStyle.lg,
            ),
          ),
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoButton(
            onPressed: () => Get.back(),
            child: Text(
              cancelLabel,
              style: TextRegularStyle.lg.copyWith(color: MyColors.error[700]),
            ),
          ),
          CupertinoButton(
            onPressed: () => Get.back(),
            child: Text(
              okLabel,
              style: TextRegularStyle.lg.copyWith(color: MyColors.primary),
            ),
          ),
        ],
      );
    }
  }
}
