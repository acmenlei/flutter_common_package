import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/user_model.dart';

/// 通用的用户头像
class UserAvatar extends StatelessWidget {
  final UserModel? user;
  final double? size;
  const UserAvatar({super.key, this.user, this.size = 20});

  @override
  Widget build(BuildContext context) {
    String avatar = user?.userThumbnailAvatar ?? user?.userAvatar ?? '';
    String defaultAvatar = "assets/images/bcdh_avatar.webp";

    return CircleAvatar(
      radius: size,
      backgroundImage:
          avatar.isEmpty ? AssetImage(defaultAvatar) : NetworkImage(avatar),
    );
  }
}
