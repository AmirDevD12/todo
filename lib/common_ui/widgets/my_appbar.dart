
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key, required this.title, this.isBack = true, this.icon}) : super(key: key);
  final String? title;
  final String? icon;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SvgPicture.asset(icon ?? Assets.logoFill),
        // const SizedBox(width: 8),
        Expanded(
          child: Text(
            title ?? "",
            textAlign: TextAlign.right,
            style: TextBoldStyle.lg.copyWith(
              color: MyColors.primary.shade900,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (isBack) ...{
          IconButton(
            onPressed: () => Get.back(),
            icon:  Icon(Hicons.left_1_light_outline,color: MyColors.grey.shade900,),
          )
        }
      ],
    );
  }
}
