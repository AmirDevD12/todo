import 'dart:io';


import 'package:image_cropper/image_cropper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/core/utils/my_app_localization.dart';
// import 'package:image_cropper/image_cropper.dart';

class ImageCropperHelper {
  static Future<File?> cropperPhoto(XFile? pickedFile, BuildContext context) async {
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: buildUiSettings(context),
      );
      if (croppedFile != null) {
        return File(croppedFile.path);
        // return await MyExifRotation.getImage(croppedFile);
      } else {
        return null;
      }
    }
    return null;
  }
}

List<PlatformUiSettings>? buildUiSettings(BuildContext context) {
  return [
    AndroidUiSettings(
        toolbarTitle: context.translate.start,
        toolbarColor: MyColors.primary,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        showCropGrid: true,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
        ],
    ),
    IOSUiSettings(
      title: context.translate.start,
      rotateClockwiseButtonHidden: false,
      rotateButtonsHidden: false,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
      ],
    ),
    WebUiSettings(
      context: context,
      presentStyle: WebPresentStyle.page,
    )
  ];
}
