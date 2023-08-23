import 'dart:async';

import 'package:dio/dio.dart';
import 'package:phone_book/common/api/retrofit_client.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';

import '../constants/constants.dart';

class ApiClient {
  factory ApiClient() => _instance;

  ApiClient._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        contentType: 'application/json',
        headers: {
          'apikey': Constants.apiKey,
        },
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        validateStatus: (int? status) => status != null && status < 500 && status != 401,
      ),
    );

    dio
      ..interceptors.clear()
      ..interceptors.add(
        QueuedInterceptorsWrapper(
          onRequest: onRequest,
          onResponse: onResponse,
          onError: onError,
        ),
      );

    retrofitClient = RetrofitClient(dio: dio);
  }

  late final Dio dio;
  late final RetrofitClient retrofitClient;
  Future<void>? isWorking;

  static final ApiClient _instance = ApiClient._init();

  Future<void> onError(DioException error, ErrorInterceptorHandler handler) async {
    errorLog(error);
    handler.next(error);
  }

  void onRequest(RequestOptions requestOptions, RequestInterceptorHandler handler) {
    infoLog(requestOptions.data);
    handler.next(requestOptions);
  }

  Future<void> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    wtfLog(response.data);
    handler.next(response);
  }
}
