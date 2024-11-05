import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/utils/render_item.dart';

/// 首页通用的无限滚动视图
class HomeCommonView extends StatefulWidget {
  final String interest;
  const HomeCommonView({super.key, required this.interest});

  @override
  State<HomeCommonView> createState() => _HomeCommonViewState();
}

class _HomeCommonViewState extends State<HomeCommonView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfinityScroll(
      fetcher: Http.client.getPosts, // 获取数据的接口
      searchParams: {
        "reviewStatus": 1,
        "current": 1,
        "needNotInterests": true,
        "hiddenContent": true,
        "sorterList": const [
          {"field": "createTime", "asc": false}
        ],
        "tags": [widget.interest]
      }, // 搜索条件
      itemRender: (body) => renderItem(body), // 渲染列表项
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
