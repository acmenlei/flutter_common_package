import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codefather_app/components/text_link_span/index.dart';
import 'package:codefather_app/pages/webview/privacy_controller.dart';
import 'package:get/get.dart';

class PrivacyDialog extends StatefulWidget {
  const PrivacyDialog({super.key});

  @override
  _PrivacyDialogState createState() => _PrivacyDialogState();
}

class _PrivacyDialogState extends State<PrivacyDialog> {
  final PrivacyController privacyController = Get.find<PrivacyController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // 阻止返回按钮关闭对话框
      child: Material(
        color: Colors.black54,
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Text('欢迎使用编程导航',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '欢迎使用编程导航！我们将通过',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            children: [
                              LinkTextSpan(
                                text: '《用户协议》',
                                url:
                                    'https://bcdh.yuque.com/staff-wpxfif/wn0r40/so5l84zqxtylggwe?singleDoc#',
                                context: context,
                              ),
                              const TextSpan(text: '与'),
                              LinkTextSpan(
                                text: '《隐私政策》',
                                url:
                                    'https://bcdh.yuque.com/staff-wpxfif/wn0r40/hh5qxxa3wh9hrcwe?singleDoc#',
                                context: context,
                              ),
                              const TextSpan(text: '帮助您了解我们如何收集、处理个人信息。'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '1、我们可能会申请相机（摄像头）、相册(存储)权限，以实现设置、更换头像、完成应用升级。',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '2、我们可能会申请电话权限，以保障软件服务的安全运营及效率、判断帐户状态、身份验证、检测及防范软件服务和支付功能的安全事件。请您放心，我们不会通过该权限获取您的电话号码、通话内容，也不会在您不知情的情况下拨打电话。',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '3、为实现内容信息分享、第三方登录等目的所必需，我们可能会调用剪切板并使用与功能相关的最小必要信息(分享链接等)，不会回传您的隐私信息。',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '4、摄像头、相册（存储）等敏感权限均不会默认或强制开启收集信息。',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '5、如果您同意请点击下面的按钮以接受我们的服务。',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      privacyController.hidePrivacyDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:
                        const Text('同意', style: TextStyle(color: Colors.white)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    privacyController.hidePrivacyDialog();
                    // 退出应用的代码
                    SystemNavigator.pop(); // 这行代码用于关闭应用程序
                  },
                  child: const Text(
                    '退出应用',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
