import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:get/get.dart';

/// 通用的用户昵称
class UserTitle extends StatelessWidget {
  final UserModel? user;
  final double fontSize;
  final bool bold;
  final Color color;
  const UserTitle(
      {super.key,
      this.user,
      this.fontSize = 14,
      this.bold = true,
      this.color = secondaryColor});

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.find<AuthService>();

    return GestureDetector(
      onTap: () {
        if (authService.userVo.value.id != user?.id) {
          Get.toNamed('/user/${user?.id}', arguments: {'id': user?.id});
        }
      },
      child: Text(
        user?.userName ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
