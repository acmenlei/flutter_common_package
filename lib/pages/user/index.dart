import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/pages/user/constants.dart';
import 'package:codefather_app/pages/user/views/comment.dart';
import 'package:codefather_app/pages/user/views/fens.dart';
import 'package:codefather_app/pages/user/views/follow.dart';
import 'package:codefather_app/pages/user/views/info.dart';
import 'package:codefather_app/pages/user/views/post.dart';
import 'package:codefather_app/pages/user/views/qa.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/pages/user/controller.dart';
import 'package:get/get.dart';

// 用户个人中心页
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();

    return Scaffold(
      body: SafeArea(child: Obx(() {
        List<String> renderTabs =
            userController.isMy.value ? userPageTabs : otherUserPageTabs;
        List<Widget> renderViews = getRenderTabViews(userController);

        final userData = userController.data.value;

        return CommonTabBarLayout(
          sliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  color: getPrimaryColor(),
                  height: double.infinity,
                  width: double.infinity,
                ),
                title: ClipOval(
                  child: UserAvatar(
                    user: userData,
                    size: 30,
                  ),
                ),
                collapseMode: CollapseMode.pin,
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground
                ],
              ),
            ),
          ],
          tabs: renderTabs.map((tab) => Tab(text: tab)).toList(),
          tabViewList: renderViews,
        );
      })),
    );
  }

  getRenderTabViews(UserController userController) {
    final userData = userController.data.value;
    return userController.isMy.value
        ? [
            UserPostView(user: userData),
            UserCommentView(user: userData),
            UserQaView(user: userData),
            const UserInfoView(),
            UserFollowView(user: userData),
            UserFensView(user: userData)
          ]
        : [
            UserPostView(user: userData),
            UserQaView(user: userData),
            UserFollowView(user: userData),
            UserFensView(user: userData)
          ];
  }
}
