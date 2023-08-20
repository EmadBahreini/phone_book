import 'package:logger/logger.dart';
import 'package:phone_book/common/resources/app_config.dart';

class Log {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 10,
      excludeBox: {
        Level.trace: true,
      },
    ),
  );

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);

    if (!AppConfig.debug) {
      // Sentry.captureException(message, stackTrace: stackTrace, hint: error);
    }
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.t(message, error: error, stackTrace: stackTrace);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
