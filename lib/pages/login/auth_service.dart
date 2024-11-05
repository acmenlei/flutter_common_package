import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/pages/login/user_secure_storage.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:get/get.dart';

// 用户信息管理
class AuthService extends GetxService {
  var isLoggedIn = false.obs;
  var userVo = UserModel().obs;

  Future<AuthService> init() async {
    var value = await UserSecureStorage.isUserLoggedIn();
    isLoggedIn.value = value;
    try {
      // 动态获取用户信息
      var res = await Http.client.getLoginUserUsingGET();
      if (res.code == 0) {
        userVo.value = res.data ?? UserModel();
      }
    } catch (e) {
      LogUtil.e(e);
    }
    LogUtil.i("是否已登录：${isLoggedIn.value}");
    return this;
  }

  Future<void> checkAndNavigate(Function() onLoggedIn) async {
    if (isLoggedIn.value) {
      onLoggedIn();
    } else {
      if (GetPlatform.isAndroid || GetPlatform.isIOS) {
        Get.toNamed('/login');
      }
    }
    LogUtil.e("当前的状态 --> checkAndNavigate --> ${isLoggedIn.value}");
  }

  Future<void> loginUser(UserModel user) async {
    userVo.value = user;
    await UserSecureStorage.saveUser(user);
    isLoggedIn.value = true;
  }

  Future<void> logoutUser() async {
    try {
      await Http.clearCookies();
      await UserSecureStorage.deleteUser(); // 删除用户信息
      userVo.value = UserModel();
      isLoggedIn.value = false;
    } catch (e) {
      LogUtil.e("当前的状态 --> logoutUser --> $e");
    }
    LogUtil.i("当前的状态 --> logoutUser ${isLoggedIn.value}");
  }
}
