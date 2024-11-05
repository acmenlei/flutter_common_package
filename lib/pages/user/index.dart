import 'package:flutter/material.dart';
import 'package:codefather_app/pages/user/controller.dart';
import 'package:get/get.dart';

// 用户个人中心页
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: FilledButton(
          onPressed: userController.logout,
          child: const Text('退出登录'),
        ),
      )),
    );
  }
}
