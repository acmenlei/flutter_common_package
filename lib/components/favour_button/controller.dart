import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/constants/favour.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';

/// 底部导航栏控制器
class FavourController {
  RxBool hasFavour = false.obs;
  RxInt favourNum = 0.obs;

  FavourController();
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
          .doFavourUsingPOST({"targetId": postId, "targetType": targetType});
      if (res.code == 0) {
        hasFavour.value =
            res.data == FavourTypeEnum.success.value ? true : false;
        favourNum.value += (res.data ?? 0);
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }
}
