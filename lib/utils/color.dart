import 'package:codefather_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 获取边框颜色
Color borderColor() {
  return Get.theme.shadowColor.withOpacity(0.1);
}

// 字体颜色
Color getPrimaryFontColor() {
  return Get.theme.indicatorColor;
}

Color getTertiaryColor() {
  return tertiaryColor;
}

Color getSecondaryColor() {
  return secondaryColor;
}

Color getShallowTertiaryColor(double? depth) {
  return tertiaryColor.withOpacity(depth ?? .1);
}
// 一般是白色背景
Color getSecondaryBackgroud() {
  return Get.theme.colorScheme.onPrimary;
}