import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/pages/webview/privacy_controller.dart';
import 'package:get/get.dart';

// 链接文本
class LinkTextSpan extends TextSpan {
  final BuildContext context;
  final String url;
  final bool isShowDialog;

  LinkTextSpan(
      {required String text,
      required this.url,
      required this.context,
      this.isShowDialog = true})
      : super(
          text: text,
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (GetPlatform.isAndroid || GetPlatform.isIOS) {
                // 打开WebView页面时，先关闭对话框
                Get.find<PrivacyController>().hidePrivacyDialog();
                Get.toNamed('/webview', arguments: {'webUrl': url})!.then((_) {
                  if (isShowDialog) {
                    // 在WebView返回时，重新显示对话框
                    Get.find<PrivacyController>().showPrivacyDialog(context);
                  }
                });
              }
            },
        );
}
