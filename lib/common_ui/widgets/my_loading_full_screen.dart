import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_loading.dart';

class MyLoadingFullScreen  {
  static show(){
    Get.dialog(
        Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(color: Color(0x7F012169)),
          child: const MyLoading(type: LoadingType.primary),
        )
    );
  }
  static dismiss(){
    Get.back();
  }
}