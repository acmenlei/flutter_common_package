import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:get/get.dart';

class HomePaegController {
  AuthService authService = Get.find<AuthService>();

  initTabBar() {
    List? interests = authService.userVo.value.interests;

    print("兴趣集合：$interests");
  }
}
