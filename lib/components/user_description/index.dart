import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:codefather_app/constants/colors.dart';

class UserDescription extends StatelessWidget {
  final UserModel? user;
  final double? fontSize;
  const UserDescription({super.key, this.user, this.fontSize = 13});

  @override
  Widget build(BuildContext context) {
    return Text(
      user?.userProfile ??
          user?.company ??
          user?.direction ??
          user?.school ??
          user?.job ??
          '这个人太懒了，没有描述',
      style: TextStyle(fontSize: fontSize, color: tertiaryColor.withOpacity(.7)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
