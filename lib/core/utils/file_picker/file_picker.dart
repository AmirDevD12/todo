import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/utils/permission_handler.dart';

class FilePickerUtils {
  static Future<XFile?> openFilePicker(BuildContext context) async {
    PermissionHandlerPermissionService permissionHandlerPermissionService =
        PermissionHandlerPermissionService();
    var permission = await permissionHandlerPermissionService.handleStoragePermission(context: context);
    if (permission == false) {
      var permission =
          await permissionHandlerPermissionService.handleStoragePermission(context: context);
    } else {
      FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (filePickerResult == null) {
        return null;
      }
      return XFile(filePickerResult.files.first.path!);
    }
    return null;
  }
}
