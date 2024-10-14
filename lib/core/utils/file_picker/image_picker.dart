import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/utils/cropper/cropper.dart';

class ImagePickerUtils {
  static Future<File?> openGallery(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    try {
      if (!context.mounted) return null;
      return await ImageCropperHelper.cropperPhoto(pickedFile, context);
    } catch (_) {}
    return null;
  }

  static Future<File?> openCamera(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100);
    try {
      if (!context.mounted) return null;
      return await ImageCropperHelper.cropperPhoto(pickedFile, context);
    } catch (_) {}
    return null;
  }
}
