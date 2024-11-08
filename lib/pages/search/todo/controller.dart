// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralSearchPageController {
  final searchText = Get.arguments?["keyword"] ?? '';
  final tabIndex = 0.obs; // 默认在综合

  // 切换tab
  onTabChange(int index) {
    tabIndex.value = index;
  }

  // 设置搜索关键词
  onSearchTextChange(String text) {
    searchText.value = text;
  }
}
