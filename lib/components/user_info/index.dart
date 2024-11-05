import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/components/follow_button/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';

/// 用户信息卡片
class UserInfo extends StatelessWidget {
  final UserModel? user;
  final Widget? desc; // 用户描述
  const UserInfo({super.key, this.user, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: UserAvatar(
              user: user,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserTitle(
                  user: user,
                ),
                desc ?? _builDescription(),
              ],
            ),
          ),
          FollowButton(user: user),
        ],
      ),
    );
  }

  // 用户简介
  _builDescription() {
    return Text(
      user?.userProfile ??
          user?.company ??
          user?.direction ??
          user?.school ??
          user?.job ??
          '这个人太懒了，没有描述',
      style: TextStyle(fontSize: 13, color: tertiaryColor.withOpacity(.7)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
