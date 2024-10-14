
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MyDropDown extends StatelessWidget {
  ///change dynamic to class need
  final List<dynamic> items;
  final dynamic value;
  final void Function(dynamic)? onChanged;

  const MyDropDown(
      {super.key,
      required this.items,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFEAF5FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: DropdownButton<dynamic>(
          style: TextMediumStyle.sm.copyWith(
            color: MyColors.primary.shade500,
          ),
          selectedItemBuilder: (context) {
            return items
                .map<Widget>((item) => Text(
              value!.name?? "",
              textAlign: TextAlign.center,
              style: TextMediumStyle.sm.copyWith(
                color: MyColors.primary.shade500,
              ),
            ))
                .toList();
          },
          borderRadius: MyRadius.base,
          isDense: true,
          underline: const SizedBox.shrink(),
          icon: Padding(
            padding: const EdgeInsets.only(right: MySpaces.s8),
            child: Icon(
              Hicons.down_2_bold,
              size: 12,
              color: MyColors.primary.shade500,
            ),
          ),
          value: value,
          onChanged: onChanged,
          dropdownColor: Colors.white,
          elevation: 2,
          items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Row(
                children: [
                  Text(
                    value.name ?? "",
                    style: TextRegularStyle.sm.copyWith(
                      color: MyColors.grey.shade900,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ).marginSymmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}
