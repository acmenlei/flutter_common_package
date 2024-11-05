import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:get/get.dart';

/// @deprecate【2024-10-29】 底部导航栏控制器
class BottomNavBarController extends GetxController {
  final AuthService auth = Get.find<AuthService>();
  RxInt currentIndex = 0.obs;

  BottomNavBarController();

  void changeIndex(int index) {
    if (index == 4) {
      if (!auth.isLoggedIn.value) {
        Get.toNamed('/login');
        return;
      }
    }
    currentIndex.value = index;
  }
}
