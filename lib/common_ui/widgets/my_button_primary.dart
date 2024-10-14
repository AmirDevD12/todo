
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MyButtonPrimary extends StatelessWidget {
   const MyButtonPrimary(
      {super.key,
      required this.onPress,
      this.disableStyle,
      this.textStyle,
        this.isExpand = false,
      required this.text, this.buttonStyle,
      this.icon});

   final ButtonStyle? disableStyle;
   final void Function() onPress;
   final TextStyle? textStyle;
   final ButtonStyle? buttonStyle;
   final String text;
   final bool isExpand;
   final Icon? icon;


   @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? Get.width : null,
      child: ElevatedButton.icon(
        icon: icon,
        iconAlignment: IconAlignment.start,
        label: Text(
          text,
          style: textStyle ?? TextMediumStyle.md.copyWith(color: MyColors.primary.shade50),
        ).paddingSymmetric(vertical: MySpaces.s12),
        onPressed: onPress,
        style: buttonStyle ??
            ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(MyColors.primaryColor)),
      ),
    );
  }
}
