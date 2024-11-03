import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyVectorBackground extends StatelessWidget {
  const MyVectorBackground({super.key, this.isOpacity = false});

  final bool isOpacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 110,
            child: Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: SvgPicture.asset(
              "assets/img/vector_2.svg",
              width: Get.width,
            ),
          ),
        )),
        Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                "assets/img/background_login.svg",
                width: Get.width,
              ),
            )),
      ],
    );
  }
}
