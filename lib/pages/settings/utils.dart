import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';

/// 退出登录
void logout() async {
  AuthService authService = Get.find<AuthService>();
  await authService.logoutUser();
  showToast('已退出登录');
  Get.offAndToNamed('/login');
}
