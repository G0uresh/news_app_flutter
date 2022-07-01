import 'package:dio/dio.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path)}");
    print('Headers:');
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print('queryParameters:');
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print('Body: ${options.data}');
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    print(
        "<-- ${response.statusMessage} ${response.requestOptions.baseUrl}");
    print('Headers:');
    response.headers.forEach((k, v) => print('$k: $v'));
    print('Response: ${response.data}');
    print('<-- END HTTP');
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(
        "<-- ${dioError.message} ${dioError.response?.requestOptions.baseUrl}");
    print(
        "${dioError.response != null ? dioError.response?.requestOptions.data : 'Unknown Error'}");
    print('<-- End error');

    super.onError(dioError, handler);

  }
}
