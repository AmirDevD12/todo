
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/common_ui/resource/image_path.dart';
import 'package:todo/common_ui/resource/my_colors.dart';

class MyVectorBackground extends StatelessWidget {
  const MyVectorBackground({super.key, this.isOpacity = false});

  final bool isOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: Stack(
        children: [
          Positioned.fill(
              child: Align(
            alignment: Alignment.topRight,
            child: Opacity(
              opacity: isOpacity ? 0.4 : 1,
              child: SvgPicture.asset(
                Assets.vectorIntroTop,
                color: MyColors.primary.shade50,
              ),
            ),
          )),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: Opacity(
               opacity: isOpacity ? 0.4 : 1,
              child: SvgPicture.asset(
                Assets.vectorIntroBottom,
                color: MyColors.primary.shade50,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
