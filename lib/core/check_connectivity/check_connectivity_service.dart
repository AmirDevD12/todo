import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class MyConnectivityService {
  static Future<bool> checkDataNetworks() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 1));

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on TimeoutException catch (_) {
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// use package connectivity_plus
  static Future<void> checkMobileNetworks() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    }
    // else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    //   // Ethernet connection available.
    // } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    //   // Vpn connection active.
    //   // Note for iOS and macOS:
    //   // There is no separate network interface type for [vpn].
    //   // It returns [other] on any device (also simulator)
    // } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
    //   // Bluetooth connection available.
    // } else if (connectivityResult.contains(ConnectivityResult.other)) {
    //   // Connected to a network which is not in the above mentioned networks.
    // } else if (connectivityResult.contains(ConnectivityResult.none)) {
    //   // No available network types
    // }
  }
}
