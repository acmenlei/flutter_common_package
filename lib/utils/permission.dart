import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:permission_handler/permission_handler.dart';

// 权限控制
class PermissionManager {
  // 权限校验，如果权限被拒绝，则弹出提示框
  Future<void> checkPermission(BuildContext context,
      {VoidCallback? callback}) async {
    Map<Permission, PermissionStatus> statuses = await _requestPermissions();

    statuses.forEach((permission, status) {
      if (status.isDenied || status.isPermanentlyDenied) {
        LogUtil.e("获取权限失败 --> permission=$permission, status=$status");
        _showPermissionDeniedDialog(context, permission);
      }
    });

    if (statuses.values.every((status) => status.isGranted)) {
      LogUtil.i("所有请求的权限已被授予");
      // 执行需要权限的操作
      callback?.call();
    } else {
      LogUtil.w("有些权限未被授予");
      // 可以在这里处理部分权限被拒绝的情况
    }
  }

  // 请求权限
  Future<Map<Permission, PermissionStatus>> _requestPermissions() async {
    // 请求基本权限
    List<Permission> permissions = [
      Permission.camera,
      // Permission.microphone,
      // Permission.phone,
      // Permission.location,
    ];

    // 根据Android版本请求存储权限
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        permissions.addAll([
          Permission.storage,
        ]);
      } else {
        permissions.addAll([Permission.photos]);
      }

      // 请求管理外部存储权限
      if (androidInfo.version.sdkInt >= 30) {
        // permissions.add(Permission.manageExternalStorage);
      }

      // 请求背景位置权限
      // if (androidInfo.version.sdkInt >= 29) {
      //   permissions.add(Permission.locationAlways);
      // }

      // 请求包可见性
      // if (androidInfo.version.sdkInt >= 30) {
      //   permissions.add(Permission.manageExternalStorage);
      // }
    }

    return await permissions.request();
  }

// 显示没有权限的对话框
  void _showPermissionDeniedDialog(
      BuildContext context, Permission permission) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          title: const Text("权限请求"),
          content:
              Text("应用需要获取${_getPermissionDescription(permission)}权限，请前往设置开启。"),
          actions: [
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FilledButton(
              child: const Text("去设置"),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  // 获取权限描述
  String _getPermissionDescription(Permission permission) {
    switch (permission) {
      case Permission.camera:
        return "相机";
      case Permission.microphone:
        return "麦克风";
      case Permission.phone:
        return "电话";
      case Permission.location:
        return "位置";
      case Permission.storage:
        return "存储";
      case Permission.photos:
        return "照片";
      case Permission.locationAlways:
        return "背景位置";
      case Permission.manageExternalStorage:
        return "管理外部存储";
      default:
        return "所需";
    }
  }
}
