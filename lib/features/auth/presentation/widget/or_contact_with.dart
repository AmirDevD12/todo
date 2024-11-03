import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

class OrContactWith extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color background;
  final bool isExpand;
  const OrContactWith({super.key, required this.text, required this.icon, required this.background,  this.isExpand = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpand?Get.width:null,
      padding: const EdgeInsets.symmetric(vertical: MySpaces.s12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.all(Radius.circular(999))
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,style: TextBoldStyle.xs
              .copyWith(color: Colors.white,),),
          const SizedBox(width: 10,),
          Icon(icon,color: Colors.white,),

        ],
      ),
    );
  }
}
