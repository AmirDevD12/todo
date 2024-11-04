import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todo/common_ui/widgets/my_bottom_shit.dart';
import 'package:todo/common_ui/widgets/my_error_network.dart';
import 'package:todo/core/check_connectivity/check_connectivity_service.dart';
import 'package:todo/core/request_pending/my_request_pending_service.dart';

class NetworkErrorInterceptor extends Interceptor {
  final Dio dio;
  NetworkErrorInterceptor({required this.dio});
  // @override
  // Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.type == DioExceptionType.connectionError && err.error is SocketException ||
  //       !(await MyConnectivityService.checkDataNetworks())) {
  //
  //     MyRequestPendingService.saveRequest( err.requestOptions);
  //
  //     if (!MyErrorNetwork.isShowBottomShitNetworkError) {
  //       MyErrorNetwork.isShowBottomShitNetworkError = true;
  //       MyBottomSheet.show(
  //         child: MyErrorNetwork.error(dio: dio),
  //         isDraggable: false,
  //         isDismissible: false,
  //       );
  //     }
  //     return;
  //   }
  //
  //   return super.onError(err, handler);
  // }
}
