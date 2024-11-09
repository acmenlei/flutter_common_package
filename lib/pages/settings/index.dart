import 'package:codefather_app/constants/external.dart';
import 'package:codefather_app/constants/index.dart';
import 'package:codefather_app/pages/settings/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 设置页面
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: renderBody(),
    );
  }

  // 渲染主体内容
  Widget renderBody() {
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: [
          const SizedBox(height: 10),
          renderCard([
            // renderItem("关于"),
            renderItem("用户协议", onTap: () {
              Get.toNamed('/webview',
                  arguments: {'webUrl': USER_AGREEMENT_URL});
            }),
            renderItem("隐私政策", onTap: () {
              // 跳转到隐私政策页面
              Get.toNamed('/webview',
                  arguments: {'webUrl': PRIVACY_POLICY_URL});
            }),
          ]),
          const SizedBox(height: 10),
          const SizedBox(
            height: 55,
            width: double.maxFinite,
            child: InkWell(
              onTap: logout,
              child: Center(
                child: Text(
                  "退出登录",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: const Center(
                child: Text("编程导航 ${Global.domain}",
                    style: TextStyle(fontSize: 14))),
          )
        ],
      ),
    );
  }

  Widget renderCard(List<Widget> widgets) {
    List<Widget> list = [];
    for (int i = 0; i < widgets.length; i++) {
      list
        ..add(widgets[i])
        ..add(const Divider(height: 1));
    }
    return Column(children: list.toList());
  }

  Widget renderItem(String title, {Widget? child, GestureTapCallback? onTap}) {
    List<Widget> list = [
      Text(title, style: const TextStyle(fontSize: 16)),
      child ?? Container()
    ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list.toList(),
        ),
      ),
    );
  }
}
