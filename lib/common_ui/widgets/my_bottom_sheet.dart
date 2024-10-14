
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';

class MyBottomSheet {
  static show({
    required Widget child,
    bool isScrollControlled = false,
  }) {
    if(Get.isBottomSheetOpen!){
      Get.back();
    }else{
      Get.bottomSheet(
        backgroundColor: MyColors.white,
        isScrollControlled: isScrollControlled,
        Container(
          width: Get.width,
          padding: const EdgeInsets.only(top: MySpaces.s12, bottom: MySpaces.s24),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD0D5DD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Flexible(child: child),
            ],
          ),
        ),
      );
    }
  }
}
