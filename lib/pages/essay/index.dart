import 'package:codefather_app/components/common_tabbar_layout/index.dart';
import 'package:codefather_app/components/common_tabbar_layout/tab_indicator.dart';
import 'package:codefather_app/pages/home/views/follow.dart';
import 'package:codefather_app/pages/home/views/hot.dart';
import 'package:codefather_app/pages/home/views/priority.dart';
import 'package:codefather_app/pages/home/views/recommand.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EssayPage extends StatefulWidget {
  const EssayPage({super.key});

  @override
  EssayPageState createState() {
    return EssayPageState();
  }
}

class EssayPageState extends State<EssayPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        pinnedHeaderSliverHeightBuilder: () {
          return MediaQuery.of(context).padding.top + kToolbarHeight;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'NestedScrollView',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                child: Container(
                  color: Get.theme.scaffoldBackgroundColor,
                  child: ExtendedTabBar(
                    labelColor: Colors.black,
                    indicatorPadding: EdgeInsets.zero, // 去掉指示器的内边距
                    indicator: CustomTabIndicator(),
                    isScrollable: true,
                    tabs: const [
                      Tab(text: "关注"),
                      Tab(text: "推荐"),
                      Tab(text: "精选"),
                      Tab(text: "热门"),
                    ],
                    controller: _tabController,
                  ),
                ),
                max: 60, // 最大高度
                min: 60, // 最小高度
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            FollowView(),
            RecommandView(),
            PriorityView(),
            HotView(),
          ],
        ),
      )),
    );
  }
}
