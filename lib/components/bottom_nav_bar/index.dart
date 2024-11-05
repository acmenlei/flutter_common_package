import 'package:flutter/material.dart';
import 'package:codefather_app/components/bottom_nav_bar/controller.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBarController bottomNavBarController =
        Get.put(BottomNavBarController());

    return Obx(() => BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
        // "首页"
        BottomNavigationBarItem(icon: Icon(Icons.hot_tub), label: "交流"),
        // "交流"
        BottomNavigationBarItem(icon: Icon(Icons.find_in_page), label: "学习"),
        //  "学习"
        BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: "课程"),
        //  "课程"
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
      ],
      currentIndex: bottomNavBarController.currentIndex.value,
      fixedColor: getPrimaryColor(),
      type: BottomNavigationBarType.fixed,
      onTap: bottomNavBarController.changeIndex,
    ));
  }
}
