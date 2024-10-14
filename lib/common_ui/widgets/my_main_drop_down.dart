
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

import '../resource/my_spaces.dart';

class MyMainDropDown extends StatelessWidget {
  final String title;
  final String value;
  final List<String> list;
  final void Function(String?)? onChanged;

  const MyMainDropDown({
    super.key,
    required this.title,
    required this.list,
    this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextRegularStyle.xs.copyWith(color: MyColors.grey.shade600),
          ),
          const SizedBox(
            height: MySpaces.s6,
          ),
          Container(
            decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: MyColors.grey.shade300)),
            child: Container(
              height: 49,
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(
                      style: TextMediumStyle.sm.copyWith(
                        color: MyColors.primary.shade500,
                      ),
                      selectedItemBuilder: (context) {
                        return list
                            .map<Widget>((item) => Text(
                                  value,
                                  textAlign: TextAlign.center,
                                  style: TextMediumStyle.sm.copyWith(
                                    color: MyColors.primary.shade500,
                                  ),
                                ))
                            .toList();
                      },
                      onChanged: onChanged,
                      value: value,
                      isExpanded: true,
                      borderRadius: MyRadius.base,
                      isDense: true,
                      underline: const SizedBox.shrink(),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: MySpaces.s8),
                        child: Icon(
                          Hicons.down_2_bold,
                          size: 14,
                          color: MyColors.primary.shade500,
                        ),
                      ),
                      dropdownColor: Colors.white,
                      elevation: 2,
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  value,
                                  maxLines: 1,
                                  style: TextRegularStyle.sm.copyWith(
                                    color: MyColors.grey.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList())
                  .marginSymmetric(vertical: 8, horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
