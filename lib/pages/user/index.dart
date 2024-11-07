import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/pages/user/constants.dart';
import 'package:codefather_app/pages/user/views/post.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/pages/user/controller.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

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

        return CommonTabBarLayout(
          sliverBuilder: (context, innerBoxIsScrolled) => [
            Obx(() {
              final userData = userController.data.value;
              return SliverAppBar(
                floating: true,
                snap: true,
                expandedHeight: 200,
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
              );
            })
          ],
          tabs: renderTabs.map((tab) => Tab(text: tab)).toList(),
          tabViewList: renderTabs
              .map(
                (tab) => UserPostView(
                  user: userController.data.value,
                ),
              )
              .toList(),
        );
      })),
    );
  }
}
