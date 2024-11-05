// import 'package:flutter/material.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';

/// 底部导航栏控制器
class IndexController extends GetxController {
  final AuthService auth = Get.find<AuthService>(); // 用户认证服务
  // final PageController pageController = PageController(); // 页面控制器
  RxInt currentIndex = 0.obs; // 当前页面索引
  DateTime? currentBackPressTime; // 记录物理键点击时间

  IndexController();


  closeOnConfirm() {
    DateTime now = DateTime.now();
    // 物理键，两次间隔大于4秒, 退出请求无效
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 4)) {
      currentBackPressTime = now;
      showToast("再按一次退出应用");
      // NavToastUtils.showToast(message: "再按一次退出应用");
      // showSnackbar(context, "再按一次退出应用",
      //     imagePath: 'assets/icons/ic_launcher.png');
      return false;
    }

    // 退出请求有效
    currentBackPressTime = null;
    return true;
  }
}
