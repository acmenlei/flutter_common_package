import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  AuthService authService = Get.find<AuthService>();
  logout() {
    authService.logoutUser();
    showToast('已退出登录');
    Get.offAndToNamed('/login');
  }
}
