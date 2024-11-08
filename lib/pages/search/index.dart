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
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/// 综合搜索页
class GeneralSearchPage extends StatelessWidget {
  const GeneralSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralSearchPageController gsController = GeneralSearchPageController();

    return Scaffold(
      body: SafeArea(
        child: CommonTabBarLayout(
          sliverBuilder: (context, isInnerBox) => [
            _buildHeader(gsController),
          ],
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
          tabViewList: [
            GeneralView(searchController: gsController),
            PassageSearchView(searchController: gsController),
            EssaySearchView(searchController: gsController),
            CourseSearchView(searchController: gsController),
            LiveSearchView(searchController: gsController),
            ResumeSearchView(searchController: gsController),
            InterviewSearchView(searchController: gsController),
            ExperienceSearchView(searchController: gsController),
            QaSearchView(searchController: gsController),
            DictSearchView(searchController: gsController),
            ToolsSearchView(searchController: gsController),
            UserSearchView(searchController: gsController),
          ],
        ),
      ),
    );
  }

  // 构建标题
  _buildHeader(GeneralSearchPageController gs) {
    return SliverAppBar(
      backgroundColor: Get.theme.colorScheme.onPrimary,
      surfaceTintColor: Get.theme.colorScheme.onPrimary,
      snap: true,
      floating: true,
      title: Row(
        children: [
          Expanded(
            child: _buildSearchBar(gs),
          ),
          const SizedBox(width: 16),
          _buildSearchButton(gs)
        ],
      ),
    );
  }

  // 搜索按钮
  _buildSearchButton(GeneralSearchPageController gs) {
    return SizedBox(
      height: 35,
      child: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          padding:
              const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: const Text(
          '搜索',
          softWrap: false,
        ),
      ),
    );
  }

  // 搜索框
  _buildSearchBar(GeneralSearchPageController gs) {
    return Container(
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
            color: tertiaryColor.withOpacity(.5),
            size: 14,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Container(
              // height: 26,
              padding: const EdgeInsets.only(bottom: 4.5),
              child: TextField(
                onChanged: (value) => gs.onSearchTextChange(value),
                cursorHeight: 14,
                decoration: InputDecoration(
                    hintText: '搜索',
                    hintStyle: TextStyle(color: tertiaryColor.withOpacity(.5)),
                    border: InputBorder.none),
                autofocus: true,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
