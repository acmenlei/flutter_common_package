import 'package:flutter/material.dart';
import 'package:codefather_app/components/my_divider/index.dart';
import 'package:codefather_app/components/reach_bottom_load_list/controller.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 通用触底加载组建
class ReachBottomLoadList extends StatelessWidget {
  final Future<dynamic> Function(Map<String, dynamic> body) fetcher; // 获取数据的方法
  final Widget Function(dynamic body) itemRender; // 获取数据的方法
  final Widget? splitter; // 分隔符
  final Map<String, dynamic> searchParams;
  final bool isCursorSearch;
  final bool? needStartRefresh;
  final double? itemGap;

  const ReachBottomLoadList({
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
    ReachBottomLoadController reachBottomLoadController =
        ReachBottomLoadController(
      fetcher,
      searchParams,
      isCursorSearch,
    );

    return Obx(
      () => Column(
        children: [
          _buildMainContent(reachBottomLoadController),
          VisibilityDetector(
            key: const Key("load_more_slot"),
            child: _buildFooterSlot(reachBottomLoadController),
            onVisibilityChanged: (VisibilityInfo info) {
              bool isShouldLoad = info.visibleFraction > 0 &&
                  reachBottomLoadController.data.length <
                      reachBottomLoadController.total.value &&
                  !reachBottomLoadController.loading.value;
              if (isShouldLoad) {
                reachBottomLoadController.loadMore();
              }
            },
          ),
        ],
      ),
    );
  }
  // 构建评论内容
  _buildMainContent(reachBottomLoadController) {
    // 首次加载的情况
    if (reachBottomLoadController.data.isEmpty &&
        reachBottomLoadController.loading.value) {
      return _buildLoadingSolt();
    }
    return ListView.builder(
      shrinkWrap: true,
      // 自适应大小而不需要参考父元素
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      // 默认的内边距
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(itemGap ?? 0),
              child: itemRender(reachBottomLoadController.data[index]),
            ),
            _buildSplitter(),
          ],
        );
      },
      itemCount: reachBottomLoadController.data.length,
    );
  }

  // 初始化会显示的加载框
  _buildLoadingSolt() {
    return Container(
      height: 280,
      alignment: Alignment.center,
      child: const SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      ),
    );
  }

  // 底部内容
  _buildFooterSlot(ReachBottomLoadController reachBottomLoadController) {
    final isLoading = reachBottomLoadController.loading.value;
    const noMoreWidget =
        Text("没有更多了～", style: TextStyle(color: Colors.transparent));
    const emptyWidget = Text('');
    final loadingWidget = Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 20,
        height: 20,
        child: const CircularProgressIndicator(strokeWidth: 2));
    // 首次加载的情况
    if (reachBottomLoadController.data.isEmpty) {
      return isLoading ? emptyWidget : noMoreWidget;
    }
    // 非首次加载的情况
    return isLoading ? loadingWidget : noMoreWidget;
  }

  // 分隔符
  _buildSplitter() {
    return splitter ?? const MyDivider(color: true, margin: 10);
  }
}
