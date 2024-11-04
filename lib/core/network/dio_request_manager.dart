
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo/core/constants/constants.dart';

import 'i_api_request_manager.dart';

class DioHttpClient extends IHttpClient {
  late Dio _dio;
  BaseOptions? options;
  final String baseUrl = Constants.baseUrl;
  final bool logEnabled;
  int _retry401 = 0;
  var logger = Logger();

  final _timeout = const Duration(seconds: 10);

  DioHttpClient({
    this.logEnabled = kDebugMode,
  }) {
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
        onRequest: (RequestOptions options, handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, handler) async {
          _retry401 = 0;
          return handler.next(response);
        },
        onError: (DioException err, handler) async {
          if(err.response != null) {
            logger.e("${err.response!.statusCode} \n${err.response!.data}",
                error: "API Error", stackTrace: StackTrace.empty);
          }


          switch (err.type) {
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            // await NoConnection.showBottomSheetNoConnectionError(handler: handler );
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.unknown:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.cancel:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.badResponse:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.badCertificate:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
            case DioExceptionType.connectionError:
              return handler.next(DioException(
                requestOptions: err.requestOptions,
                response: err.response,
                error: err.message,
              ));
          }
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

  Future retry(RequestOptions requestOptions) async {
    final options = Options(method: requestOptions.method);
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  DioException? handleResponseError(DioException e) {
    try {
      if (e.response?.data["code"] == 'token_not_invalid' ||
          e.response?.data["code"] == 'access_token_invalid') {
        //to log out user and delete access token
      } else if (e.response?.data["code"] == 'refresh_token_invalid') {
        //to log out user and delete refresh token
      }

      return DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        error: e.response!.data["messages"],
      );
    } catch (er) {
      if (kDebugMode) {
        print(er.runtimeType);
      }
      return DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        error: "Error on connecting to Server",
      );
    }
  }

  @override
  Future deleteRequest({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Dio? dio,
  }) async {
    try {
      if (dio != null) {
        _dio = dio;
      }
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future patchRequest(
      {required String path,
      data,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future postRequest(
      {required String path,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future uploadRequest(
      {required String path,
      data,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future putRequest(
      {required String path,
      data,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}
