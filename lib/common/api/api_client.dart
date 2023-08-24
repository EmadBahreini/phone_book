import 'dart:async';

import 'package:dio/dio.dart';
import 'package:phone_book/common/api/retrofit_client.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

import '../../main.dart';
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
      )
      ..interceptors.add(TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ));

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
    handler.next(requestOptions);
  }

  Future<void> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
