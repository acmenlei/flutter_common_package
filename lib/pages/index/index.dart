import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codefather_app/pages/course/index.dart';
import 'package:codefather_app/pages/essay/index.dart';
import 'package:codefather_app/pages/home/index.dart';
import 'package:codefather_app/pages/index/controller.dart';
import 'package:codefather_app/pages/learn/index.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:codefather_app/pages/user/index.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 首页
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthService authService = Get.find<AuthService>();
  IndexController indexController = Get.put(IndexController());
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    pageController = PageController(); // 保证每个页面都拥有独立的 controller

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: onPopInvoked,
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: const [
            HomePage(), // 首页
            EssayPage(), // 交流
            LearnPage(), // 学习
            CoursePage(), // 课程
            UserPage(), // 我的
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.hot_tub), label: "交流"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.find_in_page), label: "学习"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_mall), label: "课程"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
            ],
            currentIndex: indexController.currentIndex.value,
            fixedColor: getPrimaryColor(),
            type: BottomNavigationBarType.fixed,
            onTap: onBottomNavigationBarTap,
          ),
        ),
      ),
    );
  }

  // 退出程序
  onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }
    if (indexController.closeOnConfirm()) {
      // 系统级别导航栈 退出程序
      SystemNavigator.pop();
    }
  }

  // 底部导航栏切换
  onBottomNavigationBarTap(int index) {
    if (index == 4 && !authService.isLoggedIn.value) {
      Get.toNamed('/login');
      return;
    }
    indexController.currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  // 页面切换
  onPageChanged(int index) {
    onBottomNavigationBarTap(index);
  }
}
