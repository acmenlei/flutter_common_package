import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/components/infinity_scroll/controller.dart';
import 'package:codefather_app/components/my_divider/index.dart';
import 'package:get/get.dart';

/// 无限滚动组件
class InfinityScroll extends StatelessWidget {
  final Future<dynamic> Function(Map<String, dynamic> body) fetcher; // 获取数据的方法
  final Widget Function(dynamic body) itemRender; // 获取数据的方法
  final Widget? splitter; // 分隔符
  final Map<String, dynamic> searchParams;
  final bool isCursorSearch;
  final bool? needStartRefresh;
  final double? itemGap;
  const InfinityScroll({
    super.key,
    required this.fetcher,
    required this.searchParams,
    required this.itemRender,
    this.isCursorSearch = false,
    this.splitter,
    this.needStartRefresh = true,
    this.itemGap = 16,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    EasyRefreshController easyRefreshController = EasyRefreshController();
    InfinityScrollController infinityScrollController = InfinityScrollController(
      fetcher,
      searchParams,
      isCursorSearch,
    ); // 不需要添加到 Getx中，否则它会被持久化，这是不希望的

    return Obx(
      () {
        if (infinityScrollController.data.isEmpty &&
            infinityScrollController.isLoading.value) {
          return _buildSkeleton();
        }
        return EasyRefresh(
          triggerAxis: Axis.vertical,
          controller: easyRefreshController,
          footer: _buildHidePorcessedFooter(),
          // 无限加载控制
          onRefresh: needStartRefresh == true
              ? infinityScrollController.doFetch
              : null,
          onLoad: infinityScrollController.loadMore,
          child: ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            padding: const EdgeInsets.all(0), // 默认的内边距
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(itemGap ?? 0),
                    child:
                        itemRender(infinityScrollController.data[index]),
                  ),
                  index < infinityScrollController.data.length - 1 ?  _buildSplitter() : const SizedBox(),
                ],
              );
            },
            itemCount: infinityScrollController.data.length,
          ),
        );
      },
    );
  }

  // 隐藏处理成功后的footer显示
  _buildHidePorcessedFooter() {
    return const ClassicFooter(
      processedText: '',
      processedDuration: Duration.zero,
      showMessage: false,
      succeededIcon: Text(''),
    );
  }

  // todo 骨架屏
  _buildSkeleton() {
    return const Center(child: CircularProgressIndicator());
  }

  // 分隔符
  _buildSplitter() {
    return splitter ??
        const MyDivider(
          color: true,
          margin: 10,
        );
  }
}

// header: const ClassicHeader(
//   showMessage: false,
//   dragText: '下拉刷新',
//   armedText: '松手刷新',
//   processingText: '正在刷新',
//   failedText: '刷新失败',
//   readyText: '正在刷新',
//   processedText: '刷新成功',
//   // pullIconBuilder: (context, state, animation) => const Icon(Icons.arrow_downward),
// ),
// footer: ClassicFooter(
//   processingText: '加载中',
//   showMessage: false,
//   processedText: '',
//   noMoreText: '没有更多数据',
//   readyText: '正在刷新',
//   textBuilder: (context, state, text) => Text(text),
// ),
