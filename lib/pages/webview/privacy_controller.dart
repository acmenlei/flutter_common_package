import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codefather_app/pages/webview/privacy_dialog.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  var isDialogVisible = false.obs;

  void showPrivacyDialog(BuildContext context) {
    if (!isDialogVisible.value) {
      isDialogVisible.value = true;
      Get.dialog(
        const PrivacyDialog(),
        barrierDismissible: false,
      );
    }
  }

  void hidePrivacyDialog() {
    if (isDialogVisible.value) {
      Get.back();
      isDialogVisible.value = false;
    }
  }

  void acceptPrivacyPolicy() {
    hidePrivacyDialog();
    // 在这里处理用户同意隐私政策后的操作，比如导航到主页面
    // Get.offAllNamed('/home'); // 导航到主页面，替换整个导航堆栈
  }

  void exitApp() {
    SystemNavigator.pop(); // 关闭应用程序
  }

}