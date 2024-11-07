import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/components/common_tabbar_layout/tab_indicator.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:get/get.dart';

/// 通用的tabbar布局
class CommonTabBarLayout extends StatefulWidget {
  final Function(BuildContext, bool) sliverBuilder;
  final List<Tab> tabs;
  final List<Widget> tabViewList;
  final double maxExtent;
  final double minExtent;
  final TextStyle? labelStyle; // tab标签样式
  final Color? labelColor; // tab标签颜色
  final TextStyle? unselectedLabelStyle; // 未选中的tab标签样式
  final Color? unselectedLabelColor; // 为选中的tab标签颜色
  final VoidCallback? onTabChange;
  final int initialIndex;

  const CommonTabBarLayout({
    super.key,
    this.initialIndex = 0,
    this.onTabChange,
    this.labelColor,
    this.labelStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.unselectedLabelColor,
    this.unselectedLabelStyle = const TextStyle(
      fontWeight: FontWeight.normal,
    ),
    this.maxExtent = 60,
    this.minExtent = 60,
    this.sliverBuilder = _defaultSliverBuilder,
    required this.tabs,
    required this.tabViewList,
  });

  // 默认的 sliverBuilder 实现
  static List<Widget> _defaultSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return []; // 返回一个空的 List<Widget>
  }

  @override
  State<CommonTabBarLayout> createState() => _CommonTabBarLayoutState();
}

class _CommonTabBarLayoutState extends State<CommonTabBarLayout>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    tabController.addListener(tabChangeListener);
  }

  @override
  void dispose() {
    tabController.removeListener(tabChangeListener);
    tabController.dispose();
    super.dispose();
  }

  /// tab切换监听
  tabChangeListener() {
    widget.onTabChange?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExtendedNestedScrollView(
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top + kToolbarHeight;
          },
          onlyOneScrollInBody:
              true, // 滚动视图只允许存在一个【共用一个scrollController，但是也不会出现tabbarView的重复请求问题】
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            ...widget.sliverBuilder(context, innerBoxIsScrolled),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                child: Container(
                  color: Get.theme.scaffoldBackgroundColor,
                  child: ExtendedTabBar(
                    indicator: CustomTabIndicator(),
                    // indicatorPadding: EdgeInsets.zero, // 去掉指示器的内边距
                    labelStyle: widget.labelStyle,
                    unselectedLabelStyle: widget.unselectedLabelStyle,
                    labelColor: widget.labelColor ?? getPrimaryColor(),
                    unselectedLabelColor: widget.unselectedLabelColor ??
                        tertiaryColor.withOpacity(.8),
                    isScrollable: true,
                    tabs: widget.tabs,
                    controller: tabController,
                  ),
                ),
                max: widget.maxExtent, // 最大高度
                min: widget.minExtent, // 最小高度
              ),
              pinned: true,
            ),
          ],
          body: TabBarView(
            controller: tabController,
            children: widget.tabViewList,
          ),
        ),
      ),
    );
  }
}

/// 自定义SliverPersistentHeaderDelegate，用于固定悬浮 tabbar
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double max;
  final double min;
  MySliverPersistentHeaderDelegate(
      {required this.child, required this.max, required this.min});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxExtent,
      child: child,
    );
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return child != oldDelegate.child ||
        max != oldDelegate.max ||
        min != oldDelegate.min;
  }
}
