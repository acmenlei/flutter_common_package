import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/common_editor/index.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/pages/essay/tab_indicator.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

class EssayPage extends StatefulWidget {
  const EssayPage({super.key});

  @override
  State<EssayPage> createState() => _EssayPageState();
}

class _EssayPageState extends State<EssayPage> with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  @override
  void initState() {
    tabController = TabController(length: 8, vsync: this);
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.pixels >=
        (scrollController.position.maxScrollExtent - 20)) {
      print("触底加载");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            //             {
            //   "atUserList": [],
            //   "clubId": 0,
            //   "content": "学习打卡",
            //   "fileList": [],
            //   "pictureList": [],
            //   "tags": [
            //     "学习打卡"
            //   ],
            //   "videoList": []
            // }
            builder: (context) => CommonEditor(
              onSubmit: Http.client.addEssayUsingPOST,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollController,
          // innerBoxIsScrolled： NestedScrollView 内部的 ScrollView 是否已经滑动了一些内容，或者说是否有部分内容已经滚动出视口。
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(innerBoxIsScrolled ? '用户信息' : '交流'),
                // floating: true,
              ),
              SliverPersistentHeader(
                delegate: MySliverPersistentHeaderDelegate(
                  child: Container(
                    color: Get.theme.scaffoldBackgroundColor,
                    child: ExtendedTabBar(
                      indicator: CustomTabIndicator(),
                      indicatorPadding: EdgeInsets.zero, // 去掉指示器的内边距
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                      labelColor: getPrimaryColor(),
                      unselectedLabelColor: tertiaryColor.withOpacity(.6),
                      isScrollable: true,
                      tabs: const [
                        Tab(text: "关注"),
                        Tab(text: '推荐'),
                        Tab(text: '热门'),
                        Tab(text: '精选'),
                        Tab(text: 'Tab 5'),
                        Tab(text: 'Tab 6'),
                        Tab(text: 'Tab 7'),
                        Tab(text: 'Tab 8'),
                      ],
                      controller: tabController,
                    ),
                  ),
                ),
                pinned: true,
              )
            ];
          },
          body: TabBarView(controller: tabController, children: [
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                color: Colors.green,
                margin: const EdgeInsets.all(10),
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                color: Colors.blue,
                margin: const EdgeInsets.all(10),
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                color: Colors.green,
                margin: const EdgeInsets.all(10),
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                color: Colors.yellow,
                margin: const EdgeInsets.all(10),
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                color: Colors.yellow,
                margin: const EdgeInsets.all(10),
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                height: 100,
                color: Colors.yellow,
                margin: const EdgeInsets.all(10),
                child: Text(index.toString()),
              ),
              itemCount: 10,
            ),
          ]),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  MySliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxExtent,
      child: child,
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
