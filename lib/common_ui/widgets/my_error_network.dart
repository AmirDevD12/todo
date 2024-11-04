import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/check_connectivity/check_connectivity_service.dart';
import 'package:todo/core/request_pending/my_request_pending_service.dart';

class MyErrorNetwork {
  static bool isShowBottomShitNetworkError = false;
  static Widget error() {

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'اتصال به اینترنت قطع شده است',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'لطفا اتصال به اینترنت خود را بررسی کنید و دوباره تلاش کنید.',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (!await MyConnectivityService.checkDataNetworks()) {
                if (!Get.isSnackbarOpen)
                  MySnackBar.show("Error", "please check your internet");
                return;
              } else {
                Get.back();
                await MyRequestPendingService.retryRequest();
              }
            },
            child: Text('دوباره تلاش کنید'),
          ),
        ],
      ),
    );
  }
}
