import 'package:dio/dio.dart';
import 'package:news_app/common/logger/logger_util.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    log.info(
        "--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
    log.info('Headers:');
    options.headers.forEach((k, v) => log.info('$k: $v'));
    log.info('queryParameters:');
    options.queryParameters.forEach((k, v) => log.info('$k: $v'));
    if (options.data != null) {
      log.info('Body: ${options.data}');
    }
    log.info("--> END ${options.method.toUpperCase()}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    log.info(
        "<-- ${response.statusMessage} ${response.requestOptions.baseUrl}");
    log.info('Headers:');
    response.headers.forEach((k, v) => log.info('$k: $v'));
    log.info('Response: ${response.data}');
    log.info('<-- END HTTP');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.info("<-- ${err.message} ${err.response?.requestOptions.baseUrl}");
    log.info(
        "${err.response != null ? err.response?.requestOptions.data : 'Unknown Error'}");
    log.info('<-- End error');

    super.onError(err, handler);
  }
}
