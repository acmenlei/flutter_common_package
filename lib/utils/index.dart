import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

/// 是否为dark模式
bool isDark(BuildContext context) {
  final brightness = MediaQuery.of(context).platformBrightness;
  return brightness == Brightness.dark;
}

/// 获取当前主色调
Color getPrimaryColor() {
  return Get.theme.primaryColor;
}

String formatDateTimeStr(dynamic time,
    {String format = 'yyyy-MM-dd HH:mm:ss'}) {
  if (time == null) {
    return '';
  }

  // 将时间转换为 DateTime 对象
  DateTime dateTime;
  if (time is String) {
    dateTime = DateTime.parse(time); // 如果是字符串，尝试解析为 DateTime
  } else if (time is int) {
    dateTime = DateTime.fromMillisecondsSinceEpoch(time); // 如果是毫秒时间戳
  } else if (time is DateTime) {
    dateTime = time; // 如果已经是 DateTime 对象
  } else {
    return ''; // 不支持的类型，返回空字符串
  }
  // 格式化日期时间
  return DateFormat(format).format(dateTime);
}

// 深拷贝
T deepCopy<T>(T object) {
  final jsonString = json.encode(object);
  return json.decode(jsonString) as T;
}

// 将base64字符串解码为Uint8List
Uint8List? decodeBase64Image(String base64String) {
  // 检查字符串是否包含数据 URI 前缀
  if (base64String.startsWith('data:image/png;base64,')) {
    // 去掉前缀，提取纯 Base64 字符串
    base64String = base64String.replaceFirst('data:image/png;base64,', '');
  }

  try {
    // 进行 Base64 解码
    return base64Decode(base64String);
  } catch (e) {
    // ignore: avoid_print
    print('解码错误: $e');
    return null; // 或根据需要返回其他值
  }
}

// 格式化时间
String formatTimeFromNow(milliseconds) {
  try {
    // 确保时间戳是有效的（大于 0 且在合理范围内）
    if (milliseconds <= 0 ||
        milliseconds > DateTime.now().millisecondsSinceEpoch) {
      return '';
    }
    // 获取当前时间和给定时间的差值
    final DateTime now = DateTime.now();
    final DateTime inputTime =
        DateTime.fromMillisecondsSinceEpoch(milliseconds);
    final Duration duration = now.difference(inputTime);

    // 今天发布
    if (now.year == inputTime.year && now.day == inputTime.day) {
      return '今天 ${DateFormat('HH:mm').format(inputTime)}';
    }
    // 昨天发布
    if (now.year == inputTime.year && now.difference(inputTime).inDays <= 1) {
      return '昨天 ${DateFormat('HH:mm').format(inputTime)}';
    }
    // 本周内发布
    if (now.year == inputTime.year && duration.inDays < 7) {
      return '${duration.inDays}天前';
    }
    // 今年但超过一周
    if (now.year == inputTime.year) {
      return DateFormat('MM-dd HH:mm').format(inputTime);
    }
    // 去年及更早
    return DateFormat('yyyy-MM-dd').format(inputTime);
  } catch (e) {
    // 处理解析时间戳时的错误
    return '';
  }
}
// 跳转内嵌webview
void toWebView(String url) {
  Get.toNamed('/webview', arguments: {'webUrl': url});
}