
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key, required this.title, this.isBack = true, this.icon}) : super(key: key);
  final String? title;
  final String? icon;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: MySpaces.s16),
      color: MyColors.primaryColor,
      child: Row(
        children: [
          // SvgPicture.asset(icon ?? Assets.logoFill),
          // const SizedBox(width: 8),
          Expanded(
            child: Text(
              title ?? "",
              textAlign: TextAlign.left,
              style: TextBoldStyle.lg.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
       if(!isBack)const SizedBox(width: 20),
          if (isBack) ...{
            IconButton(
              onPressed: () => Get.back(),
              icon:  const Icon(Hicons.left_1_light_outline,color: Colors.white,size: 30,),
            )
          }
        ],
      ),
    );
  }
}
