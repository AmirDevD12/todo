
import 'package:flutter/material.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class DashboardRequestBox extends StatelessWidget {

  final String count;
  final String title;
  const DashboardRequestBox({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MySpaces.s12, vertical: MySpaces.s6),
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.05),
        border: Border.all(
          width: 1,
          color: MyColors.white.withOpacity(0.1),
        ),
        borderRadius: MyRadius.sm,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F101828),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x05101828),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count,
            style: TextBoldStyle.md.copyWith(
              color: MyColors.white,
            ),
          ),
          Text(
            title,
            maxLines: 1,
            style: TextLightStyle.xss.copyWith(
              color: MyColors.white,
              overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
