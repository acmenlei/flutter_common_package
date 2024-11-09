import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/components/user_avatar/index.dart';
import 'package:codefather_app/components/user_title/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/pages/user/components/non_vip_card.dart';
import 'package:codefather_app/pages/user/components/vip_card.dart';
import 'package:codefather_app/pages/user/constants.dart';
import 'package:codefather_app/pages/user/views/comment.dart';
import 'package:codefather_app/pages/user/views/fens.dart';
import 'package:codefather_app/pages/user/views/follow.dart';
import 'package:codefather_app/pages/user/views/info.dart';
import 'package:codefather_app/pages/user/views/post.dart';
import 'package:codefather_app/pages/user/views/qa.dart';
import 'package:codefather_app/utils/auth.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/pages/user/controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

        if (userController.userId.value.isEmpty) {
          return const SizedBox();
        }

        return CommonTabBarLayout(
          appbar: SliverAppBar(
            floating: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildMainUserInfo(userData),
            ),
            actions: [_buildEditIcon()],
          ),
          sliverBuilder: (context, innerBoxIsScrolled) => [
            _buildUserBaseInfo(userData),
            _buildUserSecondaryInfo(userData),
            _buildVipCard(userData),
          ],
          tabs: renderTabs.map((tab) => Tab(text: tab)).toList(),
          tabViewList: renderViews,
        );
      })),
    );
  }

  _buildEditIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/settings');
        },
        child: const Icon(
          Icons.settings_outlined,
          color: secondaryColor,
        ),
      ),
    );
  }

  // 渲染每个tab的视图
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
  _buildMainUserInfo(userData) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [getPrimaryColor(), Colors.white10],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserAvatar(
                  user: userData,
                  size: 35,
                ),
                const SizedBox(height: 8),
                UserTitle(
                  user: userData,
                  color: secondaryColor,
                  fontSize: 18,
                ),
                const SizedBox(height: 8),
                Text(
                  "${userData.userProfile ?? '这个人很懒，还没有介绍'}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: tertiaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 构建用户在网站的一些信息
  _buildUserBaseInfo(UserModel userData) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildKV("排名", userData.scoreRank)),
                Expanded(child: _buildKV("积分", userData.score)),
                Expanded(child: _buildKV("获赞", userData.postAllThumbNum)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildKV("浏览", userData.postAllViewNum)),
                Expanded(child: _buildKV("关注", userData.followNum)),
                Expanded(child: _buildKV("粉丝", userData.followeeNum)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 构建用户的次要信息
  _buildUserSecondaryInfo(UserModel userData) {
    final isWoman = userData.gender == 0;

    final gender = _buildIconV(
        isWoman ? FontAwesomeIcons.venus : FontAwesomeIcons.mars,
        isWoman ? '女' : '男',
        iconColor: isWoman ? Colors.pink : Colors.blue); // 性别
    final place =
        _buildIconV(FontAwesomeIcons.locationDot, userData.place); // 位置
    final direction =
        _buildIconV(FontAwesomeIcons.briefcase, userData.direction); // 方向
    final graduationYear = _buildIconV(
        FontAwesomeIcons.calendarCheck, userData.graduationYear); // 毕业年份
    final school =
        _buildIconV(FontAwesomeIcons.graduationCap, userData.school); // 学校
    final company =
        _buildIconV(FontAwesomeIcons.building, userData.company); // 公司

    List<Widget> children = [];

    if (gender != null) {
      children.add(gender);
    }
    if (place != null) {
      children.add(place);
    }
    if (direction != null) {
      children.add(direction);
    }
    if (graduationYear != null) {
      children.add(graduationYear);
    }
    if (school != null) {
      children.add(school);
    }
    if (company != null) {
      children.add(company);
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Wrap(
          spacing: 8,
          runSpacing: -6, // 默认的太大了，调小一些
          children: children,
        ),
      ),
    );
  }

  // 构建键值对
  _buildKV(String key, dynamic value) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
            text: '$key：',
            style: const TextStyle(
                color: secondaryColor, fontWeight: FontWeight.bold)),
        TextSpan(
            text: (value ?? '0').toString(),
            style: TextStyle(color: tertiaryColor.withOpacity(.8))),
      ],
    ));
  }

  // 构建图标和值
  _buildIconV(IconData icon, dynamic value, {Color? iconColor}) {
    if (value == null) {
      return null;
    }
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Chip(
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelPadding: const EdgeInsets.only(
            left: -1, top: -1, bottom: -1, right: 1), // 调整内边距
        backgroundColor: tertiaryColor.withOpacity(.05),
        // labelPadding: const EdgeInsets.all(-2),
        iconTheme: IconThemeData(color: iconColor ?? tertiaryColor),
        padding: const EdgeInsets.all(5),
        avatar: FaIcon(
          icon,
          size: 12,
        ),
        side: BorderSide.none, // 去除边框
        label: Text(
          value.toString(),
          style: const TextStyle(color: tertiaryColor, fontSize: 13),
        ),
      ),
    );
  }

  // 构建会员图标
  _buildVipCard(UserModel userData) {
    return SliverToBoxAdapter(
      child: isVip(userData)
          ? VipCard(user: userData)
          : NonVipCard(
              user: userData,
            ),
    );
  }
}
