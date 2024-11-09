import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/pages/search/views/course.dart';
import 'package:codefather_app/pages/search/views/dict.dart';
import 'package:codefather_app/pages/search/views/essay.dart';
import 'package:codefather_app/pages/search/views/experience.dart';
import 'package:codefather_app/pages/search/views/general.dart';
import 'package:codefather_app/pages/search/views/interview.dart';
import 'package:codefather_app/pages/search/views/live.dart';
import 'package:codefather_app/pages/search/views/passage.dart';
import 'package:codefather_app/pages/search/views/qa.dart';
import 'package:codefather_app/pages/search/views/resume.dart';
import 'package:codefather_app/pages/search/views/tools.dart';
import 'package:codefather_app/pages/search/views/user.dart';
import 'package:codefather_app/utils/color.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/// 综合搜索页
class GeneralSearchPage extends StatelessWidget {
  const GeneralSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralSearchPageController gsController = GeneralSearchPageController();
    // tabview 视图
    final tabViewList = [
      (gs, index) => GeneralView(searchController: gs, index: index),
      (gs, index) => PassageSearchView(searchController: gs, index: index),
      (gs, index) => EssaySearchView(searchController: gs, index: index),
      (gs, index) => CourseSearchView(searchController: gs, index: index),
      (gs, index) => LiveSearchView(searchController: gs, index: index),
      (gs, index) => ResumeSearchView(searchController: gs, index: index),
      (gs, index) => InterviewSearchView(searchController: gs, index: index),
      (gs, index) => ExperienceSearchView(searchController: gs, index: index),
      (gs, index) => QaSearchView(searchController: gs, index: index),
      (gs, index) => DictSearchView(searchController: gs, index: index),
      (gs, index) => ToolsSearchView(searchController: gs, index: index),
      (gs, index) => UserSearchView(searchController: gs, index: index),
    ];

    return Scaffold(
      body: SafeArea(
        child: CommonTabBarLayout(
          onTabChange: gsController.onTabChange,
          appbar: _buildHeader(gsController),
          tabs: const [
            Tab(text: '综合'),
            Tab(text: '文章'),
            Tab(text: '交流'),
            Tab(text: '教程'),
            Tab(text: '直播'),
            Tab(text: '简历'),
            Tab(text: '面试题'),
            Tab(text: '面经'),
            Tab(text: '问答'),
            Tab(text: '词典'),
            Tab(text: '工具'),
            Tab(text: '用户'),
          ],
          tabViewList: tabViewList
              .asMap()
              .keys
              .map((index) => tabViewList[index](gsController, index))
              .toList(),
        ),
      ),
    );
  }

  // 构建标题
  _buildHeader(GeneralSearchPageController gs) {
    return SliverAppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      backgroundColor: Get.theme.colorScheme.onPrimary,
      surfaceTintColor: Get.theme.colorScheme.onPrimary,
      snap: true,
      floating: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _buildSearchBar(),
          ),
          const SizedBox(width: 24),
          _buildSearchButton(gs)
        ],
      ),
    );
  }

  // 搜索按钮
  _buildSearchButton(GeneralSearchPageController gs) {
    return GestureDetector(
      onTap: Get.back,
      child: Text(
        '取消',
        style: TextStyle(fontSize: 16, color: getPrimaryColor()),
      ),
    );
  }

  // 搜索框
  _buildSearchBar() {
    String keyword = Get.arguments["keyword"].toString();
    return GestureDetector(
      onTap: () => Get.offAndToNamed("/search_forward", arguments: {
        "keyword": Get.arguments["keyword"],
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 35,
        decoration: BoxDecoration(
          color: tertiaryColor.withOpacity(.06),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.search,
              color: getShallowTertiaryColor(.5),
              size: 14,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                keyword.isEmpty ? "搜索文章/交流/教程/直播等内容" : keyword,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: keyword.isEmpty ? getShallowTertiaryColor(.6) : getSecondaryColor(),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
