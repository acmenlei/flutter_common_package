import 'package:dio/dio.dart';

// 请求拦截器
class ResponseHandler extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: avoid_print
    // print("响应内容: ${response.data.toString()}");
    super.onResponse(response, handler);
  }
}
