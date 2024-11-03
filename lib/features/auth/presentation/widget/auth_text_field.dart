import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.rightWidget,
      this.hint,
      this.maxLength,
      this.isPhone = false,
      this.isPassword = false,
      this.rightIconTap,
      this.textInputAction = TextInputAction.done,
      this.isHidePassword = false,
      this.onChanged,
      this.isTextArea = false,
      this.leftIcon,
      this.readOnly});

  final TextEditingController controller;
  final String label;
  final IconData? leftIcon;
  final String? hint;
  final int? maxLength;
  final bool isPhone;
  final bool isPassword;
  final void Function()? rightIconTap;
  final TextInputAction? textInputAction;
  final bool? isHidePassword;
  final ValueChanged<String>? onChanged;
  final bool isTextArea;
  final Widget? rightWidget;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextRegularStyle.xs.copyWith(color: MyColors.grey.shade600)),
        const SizedBox(height: MySpaces.s6),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: MySpaces.s32),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(999))
          ),
          child: TextField(
            readOnly: readOnly ?? false,
            controller: controller,
            keyboardType: isPhone
                ? TextInputType.phone
                : isPassword
                    ? TextInputType.visiblePassword
                    : isTextArea
                        ? TextInputType.multiline
                        : TextInputType.text,
            obscureText: isHidePassword ?? false,
            maxLines: isTextArea ? 4 : 1,
            textInputAction: textInputAction,
            maxLength: maxLength,
            textAlign: !isPhone && !isPassword ? TextAlign.end : TextAlign.end,
            autofocus: false,
            cursorColor: MyColors.primaryColor,
            onChanged: isPhone == false
                ? onChanged
                : (value) {
                    if (isPhone) {
                      value = value.toPersianDigit();
                      controller.value = TextEditingValue(
                        text: value,
                        selection:
                            TextSelection.collapsed(offset: value.length),
                      );
                    }
                  },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(999)),
                borderSide: BorderSide(color: MyColors.border, width: 1.0),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(999)),
                borderSide: BorderSide(color: MyColors.border, width: 1.0),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  borderSide: BorderSide(color: MyColors.border, width: 1.0)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  borderSide: BorderSide(color: MyColors.border, width: 1.0)),
              counterText: '',
              hintText: hint != null ? hint.toString().toPersianDigit() : "",
              hintStyle:
                  TextRegularStyle.md.copyWith(color: MyColors.grey.shade400),
              floatingLabelStyle: const TextStyle(color: Color(0xff9E9E9E)),

              suffixIcon: leftIcon != null
                  ? Padding(
                    padding: const EdgeInsets.only(left: 10,),
                    child: GestureDetector(
                        onTap: rightIconTap,
                        child: Icon(leftIcon, color: MyColors.grey.shade500)),
                  )
                  : null,
              prefixIcon: rightWidget,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
      ],
    );
  }
}
