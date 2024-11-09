import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool isMy = false.obs;
  RxString userId = ''.obs;
  AuthService authService = Get.find<AuthService>();
  Rx<UserModel> data = UserModel().obs;
  RxBool loading = false.obs;

  UserController() {
    userId.value = Get.arguments != null
        ? Get.arguments["id"]
        : authService.userVo.value.id;
    isMy.value = userId.value == authService.userVo.value.id;
    getUserVoById(); // 获取用户信息
  }

  /// 获取用户信息
  getUserVoById() async {
    if (isMy.value) {
      data.value = authService.userVo.value;
      return;
    }
    if (userId.value.isEmpty) {
      return;
    }
    loading.value = true;
    try {
      final res = await Http.client.getUserVoById(userId.value);
      if (res.code == 0) {
        data.value = res.data ?? UserModel();
      }
    } catch (e) {
      LogUtil.e(e);
    }
    loading.value = false;
  }
}
