import 'package:flutter/material.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';

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
              MySnackBar.show("Error", "please check your internet");
            },
            child: Text('دوباره تلاش کنید'),
          ),
        ],
      ),
    );
  }
}
