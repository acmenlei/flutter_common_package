import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:codefather_app/api/interceptors/request.dart';
import 'package:codefather_app/api/interceptors/response.dart';
import 'package:codefather_app/api/models/post/post_model.dart';
import 'package:codefather_app/api/service/api_service.dart';
import 'package:codefather_app/constants/index.dart';
import 'package:path_provider/path_provider.dart';

/// 最基础的请求配置
class Http {
  static final Dio _dio = Dio();
  static final ApiService client = ApiService(_dio);
  static late PersistCookieJar _cookieJar;

  static void init() async {
    // 处理 cookie
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    _cookieJar = PersistCookieJar(storage: FileStorage(appDocDir.path));
    _dio.interceptors.add(CookieManager(_cookieJar));
    // 请求/响应拦截器
    _dio.interceptors.add(RequestHanlder());
    _dio.interceptors.add(ResponseHandler());
  }

  static Future<void> clearCookies() async {
    await _cookieJar.deleteAll();
    // print("Cookies have been cleared.");
  }

  // 获取当前域名下的所有的 cookie
  static Future<List<Map<String, String>>> extractCookies() async {
    final uri = Uri.parse(Global.baseUrl);
    final cookies = await _cookieJar.loadForRequest(uri);
    return cookies.map((cookie) {
      return {
        'name': cookie.name,
        'value': cookie.value,
        'domain': cookie.domain ?? '',
      };
    }).toList();
  }

  /// todo: 获取文章列表【此处请求逻辑应该抽离到单独的页面中】
  static Future<List<PostModel>?> get(params) async {
    try {
      final response = await client.getPosts(params);
      if (response.code == 0) {
        return response.data.records;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
