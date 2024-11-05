import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/constants/thumb.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';

/// 底部导航栏控制器
class ThumbController {
  RxBool hasThumb = false.obs;
  RxInt thumbNum = 0.obs;

  ThumbController();
  AuthService authService = Get.find<AuthService>();

  // 关注操作
  onPress(postId, targetType) async {
    if (!authService.isLoggedIn.value) {
      showToast("未登录");
      Get.toNamed('/login');
      return;
    }
    try {
      final res = await Http.client
          .doThumbUsingPOST({"targetId": postId, "type": targetType});
      if (res.code == 0) {
        hasThumb.value = res.data == ThumbTypeEnum.success.value ? true : false;
        thumbNum.value += (res.data ?? 0);
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }
}
