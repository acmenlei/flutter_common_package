import 'package:dio/dio.dart';

// 请求拦截器
class RequestHanlder extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ignore: avoid_print
    print('请求地址：${options.baseUrl}${options.path}');
    // ignore: avoid_print
    print('请求参数：${options.data}');
    // ignore: avoid_print
    // print('请求选项：${options.headers.toString()}');
    super.onRequest(options, handler);
  }
}
