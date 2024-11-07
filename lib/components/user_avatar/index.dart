import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:get/get.dart';

/// 通用的用户头像
class UserAvatar extends StatelessWidget {
  final UserModel? user;
  final double? size;
  const UserAvatar({super.key, this.user, this.size = 20});

  @override
  Widget build(BuildContext context) {
    String avatar = user?.userThumbnailAvatar ?? user?.userAvatar ?? '';
    String defaultAvatar = "assets/images/bcdh_avatar.webp";
    AuthService authService = Get.find<AuthService>();

    return GestureDetector(
      onTap: () {
        if(authService.userVo.value.id != user?.id) {
          Get.toNamed('/user/${user?.id}', arguments: {'id': user?.id});
        }
      },
      child: CircleAvatar(
        radius: size,
        backgroundImage:
            avatar.isEmpty ? AssetImage(defaultAvatar) : NetworkImage(avatar),
      ),
    );
  }
}
