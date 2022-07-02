import 'package:dio/dio.dart';
import 'package:news_app/common/logger/logger_util.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    LOG.info(
        "--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
    LOG.info('Headers:');
    options.headers.forEach((k, v) => LOG.info('$k: $v'));
    LOG.info('queryParameters:');
    options.queryParameters.forEach((k, v) => LOG.info('$k: $v'));
    if (options.data != null) {
      LOG.info('Body: ${options.data}');
    }
    LOG.info("--> END ${options.method.toUpperCase()}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    LOG.info(
        "<-- ${response.statusMessage} ${response.requestOptions.baseUrl}");
    LOG.info('Headers:');
    response.headers.forEach((k, v) => LOG.info('$k: $v'));
    LOG.info('Response: ${response.data}');
    LOG.info('<-- END HTTP');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LOG.info("<-- ${err.message} ${err.response?.requestOptions.baseUrl}");
    LOG.info(
        "${err.response != null ? err.response?.requestOptions.data : 'Unknown Error'}");
    LOG.info('<-- End error');

    super.onError(err, handler);
  }
}
