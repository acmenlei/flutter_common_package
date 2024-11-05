import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/utils/render_item.dart';

/// 推荐数据
class RecommandView extends StatefulWidget {
  const RecommandView({super.key});

  @override
  State<RecommandView> createState() => _RecommandViewState();
}

class _RecommandViewState extends State<RecommandView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfinityScroll(
      fetcher: Http.client.getPosts, // 获取数据的接口
      searchParams: const {
        "reviewStatus": 1,
        "current": 1,
        "needNotInterests": true,
        "hiddenContent": true,
        "sorterList": [
          {"field": "createTime", "asc": false}
        ],
        "showPost": 0,
        "needCursor": true,
        "cursorList": [
          {"field": "createTime", "asc": false},
          {"field": "id", "asc": false}
        ]
      }, // 搜索条件
      isCursorSearch: true, // 是否使用游标搜索
      itemRender: (body) => renderItem(body), // 渲染列表项
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
