import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerUtil extends Logger {
  LoggerUtil({
    LogPrinter? printer,
    Level? level,
  }) : super( printer: printer,  level: level);

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      i(message, error, stackTrace);

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      e(message, error, stackTrace);

  static Level logLevel({
    bool isTestEnvironment = false,
  }) {
    if (kReleaseMode) {
      return Level.nothing;
    }
    return Level.verbose;
  }
}

LoggerUtil _myLogger = LoggerUtil(
  level: LoggerUtil.logLevel(),
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 150,
    printTime: true,
    printEmojis: false,
  ),
);

LoggerUtil log = _myLogger;
