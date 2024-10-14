import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo/common_ui/widgets/custom_alert_dialog.dart';

class PermissionHandlerPermissionService {
  Future<bool> handleCameraPermission({required BuildContext context}) async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    if (cameraPermissionStatus == PermissionStatus.granted) {
      return true;
    } else if (cameraPermissionStatus == PermissionStatus.permanentlyDenied) {
      showCameraPermissionDialogue(context: context);
      return false;
    } else {
      return false;
    }
  }

  Future<bool> handlePhotosPermission({required BuildContext context}) async {
    PermissionStatus photosPermissionStatus = await Permission.photos.request();

    if (photosPermissionStatus == PermissionStatus.granted) {
      return true;
    } else if (photosPermissionStatus == PermissionStatus.permanentlyDenied) {
      showGalleryPermissionDialogue(context: context);
      return false;
    } else {
      return false;
    }
  }
  Future<bool> handleStoragePermission({required BuildContext context}) async {
    PermissionStatus photosPermissionStatus = await Permission.storage.request();

    if (photosPermissionStatus == PermissionStatus.granted) {
      return true;
    } else if (photosPermissionStatus == PermissionStatus.permanentlyDenied) {
      showStoragePermissionDialogue(context: context);
      return false;
    } else {
      return false;
    }
  }

  static showCameraPermissionDialogue({required BuildContext context}) async {
    bool? result = await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: "Permission Denied!!",
        message: "This app does not have permission to use Camera",
        okLabel: "Go to Setting",
        cancelLabel: "Cancel",
      ),
    );

    if (result != null && result) {
      openAppSettings();
    }
  }

  static showGalleryPermissionDialogue({required BuildContext context}) async {
    bool? result = await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: "Permission Denied!!",
        message: "This app does not have permission to use Photos",
        okLabel: "Go to Setting",
        cancelLabel: "Cancel",
      ),
    );

    if (result != null && result) {
      openAppSettings();
    }
  }
  static showStoragePermissionDialogue({required BuildContext context}) async {
    bool? result = await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: "Permission Denied!!",
        message: "This app does not have permission to use Storage",
        okLabel: "Go to Setting",
        cancelLabel: "Cancel",
      ),
    );

    if (result != null && result) {
      openAppSettings();
    }
  }
}
