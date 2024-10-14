
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MyNoData extends StatelessWidget {
  const MyNoData({Key? key,required this.text, required this.icon}) : super(key: key);
  final String? text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(MySpaces.s12),
            decoration: ShapeDecoration(
              color: const Color(0xFF99CEFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Icon(Hicons.information_square_light_outline, color: MyColors.primary.shade600, size: 24),
          ),
          const SizedBox(height: MySpaces.s16),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: TextMediumStyle.sm.copyWith(
              color: MyColors.grey.shade700,
            ),
          )
        ],
      ),
    );

  }

}