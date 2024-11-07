import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';
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
            _buildAppBar(userData), /*  _buildUserInfo(userData) */
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

  // 构建用户头像主要信息
  _buildAppBar(userData) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      floating: true,
      snap: true,
      toolbarHeight: 168, // 设置 AppBar 的高度
      expandedHeight: 168, // 和 toolbarHeight 一样高就不会导致内容溢出
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [getPrimaryColor(), Colors.white10],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        width: Get.width,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserAvatar(
                user: userData,
                size: 30,
              ),
              const SizedBox(height: 8),
              UserTitle(
                user: userData,
                color: secondaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                userData.userProfile ?? '',
                style: const TextStyle(color: tertiaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建用户次要信息
  // _buildUserInfo(userData) {
  //   return SliverToBoxAdapter(
  //       child: Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     child: const Text(''),
  //   ));
  // }
}
