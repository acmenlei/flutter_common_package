import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:codefather_app/constants/access.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:get/get.dart';

// 是否登录？
bool isLogin = Get.find<AuthService>().isLoggedIn.value;

// 获取当前登录用户的信息
UserModel? getLoginUser() {
  AuthService authService = Get.find<AuthService>();
  return authService.userVo.value;
}

// 是否是会员？
bool isVip(UserModel? userData) {
  UserModel? user = userData ?? getLoginUser();
  return user != null &&
      user.userRole != null &&
      (UserRoleEnum.vip.value == user.userRole ||
          UserRoleEnum.admin.value == user.userRole ||
          UserRoleEnum.guest.value == user.userRole) &&
      DateTime.fromMillisecondsSinceEpoch(user.vipExpireTime ?? 0)
          .isAfter(DateTime.now());
}
