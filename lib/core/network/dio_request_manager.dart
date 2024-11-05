import 'dart:async';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo/common_ui/widgets/my_bottom_shit.dart';
import 'package:todo/common_ui/widgets/my_error_network.dart';
import 'package:todo/core/check_connectivity/check_connectivity_service.dart';
import 'package:todo/core/constants/constants.dart';
import 'package:todo/core/network/i_api_request_manager.dart';

class DioHttpClient extends IHttpClient {
  late Dio _dio;
  BaseOptions? options;
  final String baseUrl = Constants.baseUrl;
  final bool logEnabled;
  var logger = Logger();
  final _timeout = const Duration(seconds: 10);
  Completer? _requestCompleter;

  DioHttpClient({this.logEnabled = kDebugMode}) {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'accept-charset': 'UTF-8',
      },
    );

    _dio = Dio(options);
    _dio.interceptors.add(CurlLoggerDioInterceptor());
    setInterceptor();
  }

  void setInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException err, handler) async {
          if (err.response != null) {
            logger.e("${err.response!.statusCode} \n${err.response!.data}",
                error: "API Error", stackTrace: StackTrace.empty);
          }
          return handler.next(err);
        },
      ),
    );

    if (logEnabled) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  Future<dynamic> _retryRequest(RequestOptions requestOptions) async {
    final options = Options(method: requestOptions.method);
    return _dio.request(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<dynamic> sendRequest({
    required String method,
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
        ),
      );
      return response.data;
    } on DioException catch (err) {
      if (err.type == DioExceptionType.connectionError ||
          err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.unknown) {

        _requestCompleter = Completer();

        MyConnectivityService.changeStateConnection();
        if (!MyErrorNetwork.isShowBottomShitNetworkError) {
          MyErrorNetwork.isShowBottomShitNetworkError = true;
          MyBottomSheet.show(
            child: MyErrorNetwork.error(),
            isDraggable: false,
            isDismissible: false,
          );

          MyConnectivityService.updateStateConnection.stream
              .asBroadcastStream()
              .listen((isConnected) async {
            if (isConnected && !_requestCompleter!.isCompleted) {
              try {
                final retryResponse = await _retryRequest(err.requestOptions);
                _requestCompleter!.complete(retryResponse.data);
                MyErrorNetwork.isShowBottomShitNetworkError = false;
                Get.back();
              } catch (retryError) {
                if (!_requestCompleter!.isCompleted) {
                  _requestCompleter!.completeError(retryError);
                }
              }
            }
          });
        }

        return _requestCompleter!.future;
      } else {
        rethrow;
      }
    }
  }

  @override
  Future getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return sendRequest(
      method: 'GET',
      path: path,
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  @override
  Future postRequest({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return sendRequest(
      method: 'POST',
      path: path,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  @override
  Future putRequest({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return sendRequest(
      method: 'PUT',
      path: path,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  @override
  Future deleteRequest({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {

    return sendRequest(
      method: 'DELETE',
      path: path,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  @override
  Future patchRequest({
    required String path,
    data,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return sendRequest(
      method: 'PATCH',
      path: path,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  @override
  Future uploadRequest({
    required String path,
    data,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return sendRequest(
      method: 'POST',
      path: path,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
  }
}
