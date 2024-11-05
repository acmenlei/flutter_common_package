import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:get/get.dart';

// 是否登录？
bool isLogin = Get.find<AuthService>().isLoggedIn.value;
