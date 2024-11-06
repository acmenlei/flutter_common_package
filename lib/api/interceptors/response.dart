import 'package:dio/dio.dart';
import 'package:get/get.dart';

// 请求拦截器
class ResponseHandler extends InterceptorsWrapper {
  @override
  void onResponse( response, ResponseInterceptorHandler handler) {
    // ignore: avoid_print
    // print("响应内容: ${response.data.toString()}");
    super.onResponse(response, handler);
    final statusCode = response.data["code"];

    if (statusCode == 40100) {
      Get.toNamed('/login');
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: "请求失败",
      ));
    }
  }
}
