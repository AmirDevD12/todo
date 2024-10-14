
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MyNotificationBadge extends StatelessWidget {
  final String? text;

  const MyNotificationBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Hicons.notification_1_light_outline,
            color: Colors.white,
          ),
          iconSize: MySpaces.s32,
          onPressed: () {
            // Get.toNamed(Routes.emergency);
          },
        ),
        if(text != null)...[
          Positioned(
            bottom: 7,
            right: 8,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.secondary.shade500,
                shape: BoxShape.circle,
                border: Border.all(
                  color: MyColors.primary.shade900,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                text ?? "",
                style: TextMediumStyle.xxs.copyWith(color: MyColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
