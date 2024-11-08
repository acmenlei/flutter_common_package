import 'package:codefather_app/pages/search/controller.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/color.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/// 综合搜索页
class SearchForWardPage extends StatelessWidget {
  const SearchForWardPage({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralSearchPageController gsController = GeneralSearchPageController();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader(gsController),
            _buildBody(gsController),
          ],
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
            child: _buildSearchBar(gs),
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
  _buildSearchBar(
    GeneralSearchPageController gs,
  ) {
    return Container(
      alignment: Alignment.center,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: getShallowTertiaryColor(.06),
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
              padding: const EdgeInsets.only(bottom: 3.9),
              child: TextField(
                controller: TextEditingController(text: Get.arguments?['keyword']),
                onSubmitted: (value) => Get.offAndToNamed('/search_result',
                    arguments: {"keyword": value}),
                cursorHeight: 14,
                decoration: InputDecoration(
                  hintText: '搜索',
                  hintStyle: TextStyle(color: getShallowTertiaryColor(.5)),
                  border: InputBorder.none,
                ),
                autofocus: true,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 渲染主体
  _buildBody(GeneralSearchPageController gsController) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Text("搜索历史..."),
      ),
    );
  }
}
