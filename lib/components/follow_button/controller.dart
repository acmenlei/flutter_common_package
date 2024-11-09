import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/constants/follow.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';

/// 底部导航栏控制器
class FollowController {
  var followStatus = 0.obs;
  AuthService authService = Get.find<AuthService>();

  FollowController(int fs) {
    followStatus.value = fs;
  }

  void setInitialFollowStatus(int status) {
    followStatus.value = status;
  }

  // 关注操作
  onPress(followeeId) async {
    if (!authService.isLoggedIn.value) {
      showToast("未登录");
      Get.toNamed('/login');
      return;
    }
    try {
      final res =
          await Http.client.doFollowUsingPOST({"followeeId": followeeId});
      if (res.code == 0) {
        final status = res.data ?? FollowTypeEnum.followFaild.value;
        if (status > 0) {
          followStatus.value = FollowTypeEnum.followSuccess.value;
        } else {
          followStatus.value = FollowTypeEnum.followCancel.value;
        }
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }
}
