import 'dart:async';

import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MySearchField extends StatelessWidget {
  const MySearchField(
      {super.key,
      required this.controller,
      this.leftIcon,
      this.rightIcon,
      this.hint,
      this.maxLength,
      this.rightIconTap,
      this.leftIconTap,
      this.textInputAction = TextInputAction.done,
      this.onChanged});

  final TextEditingController controller;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String? hint;
  final int? maxLength;
  final void Function()? rightIconTap;
  final void Function()? leftIconTap;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final bool autoFocus = false;

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    userWrites() {
      try {
        onChanged?.call(controller.text);
      } catch (_) {}
    }


    controller.addListener(() {
      if (controller.text.isEmpty) {
      } else {
        if (timer != null) {
          timer!.cancel();
          timer = null;
        }
        timer = Timer(const Duration(seconds: 3), userWrites);
      }
    });

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: textInputAction,
          maxLength: maxLength,
          textAlign: TextAlign.start,
          autofocus: autoFocus,
          cursorColor: MyColors.grey.shade600,
          // onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: MyColors.primary,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyColors.grey.shade300, width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyColors.grey.shade300, width: 1.0)),
            counterText: '',
              hintText: hint != null ? hint.toString().toPersianDigit() : "",
            hintStyle: TextRegularStyle.md.copyWith(color: MyColors.grey.shade400),
            floatingLabelStyle: const TextStyle(color: Color(0xff9E9E9E)),
            suffixIcon: leftIcon != null
                ? IconButton(
                    onPressed: leftIconTap, icon: Icon(leftIcon, color: MyColors.grey.shade500))
                : null,
            prefixIcon: rightIcon != null
                ? IconButton(
                    onPressed: rightIconTap, icon: Icon(rightIcon, color: MyColors.grey.shade500))
                : null,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      ],
    );
  }
}
