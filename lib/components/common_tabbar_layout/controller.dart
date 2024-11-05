import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTabbarLayoutController {
  var tabControllerIndex = 0.obs;
  var currentTabIndex = 1.obs;

  void handleTabChange(TabController tabController) {
    if (tabController.indexIsChanging) {
      currentTabIndex.value = tabController.index;
    }
  }
}
