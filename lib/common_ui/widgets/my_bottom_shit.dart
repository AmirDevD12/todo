
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resource/my_spaces.dart';

class MyBottomSheet {
  static show({
    required Widget child,
    bool isDismissible = true,
    bool isDraggable = false,
  }) {
    if(Get.isBottomSheetOpen!){
      Get.back();
    }else{
      showModalBottomSheet(
        isDismissible: isDismissible,
        context: Get.context!,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        useRootNavigator: true,
        enableDrag: isDraggable,
        useSafeArea: true,
        builder: (context) {
          return PopScope(
            canPop: isDismissible,
            child: SafeArea(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.only(top: MySpaces.s12, bottom: MySpaces.s24),
                child:isDraggable?child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: MySpaces.s12),
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
                      const SizedBox(height: MySpaces.s12),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
