import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:codefather_app/components/common_icon_button/index.dart';
import 'package:codefather_app/components/text_link_span/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/pages/login/controller.dart';
import 'package:codefather_app/pages/webview/privacy_controller.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';

/// 登录页
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(PrivacyController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,
              size: 32, color: getPrimaryColor()),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              _buildForm(),
              _buildPrivacyService(context),
              const Spacer(),
              _buildWechatLogin(),
            ],
          ),
        ),
      ),
    );
  }

  // 登录
  _buildForm() {
    LoginController loginController = Get.find<LoginController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextField(
            onChanged: loginController.changePhone,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: '手机号',
              prefix: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  '+86',
                  style: TextStyle(color: secondaryColor),
                ),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: TextField(
                onChanged: loginController.changeSmsCaptcha,
                decoration: const InputDecoration(
                  labelText: '图形验证码',
                ),
                keyboardType: TextInputType.number,
              )),
              const SizedBox(
                width: 20,
              ),
              Obx(() => _buildCaptcha())
            ],
          ),
          const SizedBox(height: 25),
          _buildGetSmsCaptchaBtn(),
        ],
      ),
    );
  }

  // 获取验证码按钮
  _buildGetSmsCaptchaBtn() {
    LoginController loginController = Get.find<LoginController>();
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Obx(() => FilledButton(
            onPressed: (loginController.checked.value &&
                    loginController.phone.value.length == 11 &&
                    loginController.smsCaptcha.value.isNotEmpty)
                ? () => loginController.sendSmsCaptchaUsingPOST(null)
                : null,
            child: const Text('获取短信验证码',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
    );
  }

  // 图形验证码
  _buildCaptcha() {
    LoginController loginController = Get.find<LoginController>();
    if (loginController.captcha.value.isEmpty) {
      return const SizedBox();
    }
    return Row(
      children: [
        Image.memory(
          decodeBase64Image(loginController.captcha.value) as Uint8List,
          height: 40,
          width: 100,
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: loginController.getSmsCaptchaUsingGET,
        ),
      ],
    );
  }

  // 标题栏
  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
          ),
          const Text(
            "登录体验更多精彩",
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  // 隐私与政策服务
  _buildPrivacyService(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Checkbox(
              value: loginController.checked.value,
              onChanged: loginController.toggleChecked,
              activeColor: getPrimaryColor(), // 选中时显示对勾
            )),
        RichText(
          text: TextSpan(
            text: '已阅读并同意',
            style: const TextStyle(color: secondaryColor),
            children: [
              LinkTextSpan(
                text: '《用户协议》',
                url:
                    'https://bcdh.yuque.com/staff-wpxfif/wn0r40/so5l84zqxtylggwe?singleDoc#',
                context: context,
                isShowDialog: false,
              ),
              const TextSpan(
                text: '和',
                style: TextStyle(color: secondaryColor),
              ),
              LinkTextSpan(
                text: '《隐私政策》',
                url:
                    'https://bcdh.yuque.com/staff-wpxfif/wn0r40/hh5qxxa3wh9hrcwe?singleDoc#',
                context: context,
                isShowDialog: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 微信登录按钮
  _buildWechatLogin() {
    LoginController loginController = Get.find<LoginController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonIconButton(
          onPressed: () async {
            if (!loginController.checked.value) {
              showToast('请先勾选隐私政策复选框');
              return;
            }
            var isOpenWeChat = await loginController.fluwx.authBy(
              which: NormalAuth(
                scope: 'snsapi_userinfo',
                state: 'wechat_sdk_nav_code',
              ),
            );
            LogUtil.e("点击微信登录按钮打开状态 ---> isOpenWeChat=$isOpenWeChat");
          },
          isOutlined: true,
          imagePath: 'assets/images/ic_wechat_btn.png',
        ),
      ],
    );
  }
}
