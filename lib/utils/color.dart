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