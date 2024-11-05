import 'package:flutter/material.dart';
import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/pages/home/constants.dart';
import 'package:codefather_app/pages/home/views/common.dart';
import 'package:codefather_app/pages/home/views/follow.dart';
import 'package:codefather_app/pages/home/views/hot.dart';
import 'package:codefather_app/pages/home/views/priority.dart';
import 'package:codefather_app/pages/home/views/recommand.dart';
import 'package:codefather_app/pages/login/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    List interests = <dynamic>{
      ...defaultInterests,
      ...(authService.userVo.value.interests ?? [])
    }.toList();

    return Scaffold(
      body: SafeArea(
        child: CommonTabBarLayout(
          initialIndex: 1,
          tabs: [
            const Tab(text: "关注"),
            const Tab(text: "推荐"),
            const Tab(text: "精选"),
            const Tab(text: "热门"),
            ...(interests.map(
              (interest) => (Tab(
                text: interest,
              )),
            )),
          ],
          sliverBuilder: (context, innerBoxIsScrolled) {
            return [_buildHeader()];
          },
          tabViewList: [
            const FollowView(),
            const RecommandView(),
            const PriorityView(),
            const HotView(),
            // 默认兴趣
            ...(interests.map(
              (interest) => (HomeCommonView(interest: interest)),
            ))
          ],
        ),
      ),
    );
  }

  // 构建标题
  _buildHeader() {
    return SliverAppBar(
      title: Row(
        children: [
          Expanded(
            child: _buildSearchBar(),
          ),
          const SizedBox(
            width: 16,
          ),
          _buildSearchButton()
        ],
      ),
    );
  }

  // 搜索按钮
  _buildSearchButton() {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Text('搜索'),
    );
  }

  // 搜索框
  _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: tertiaryColor.withOpacity(.06),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.search,
            color: tertiaryColor.withOpacity(.5),
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            "搜索",
            style: TextStyle(
              color: tertiaryColor.withOpacity(.3),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
