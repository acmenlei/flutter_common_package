import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/utils/render_item.dart';

/// 精选页面
class HotView extends StatefulWidget {
  const HotView({super.key});

  @override
  State<HotView> createState() => _HotViewState();
}

class _HotViewState extends State<HotView> with AutomaticKeepAliveClientMixin {
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
        "queryType": "hot"
      }, // 搜索条件
      itemRender: (body) => renderItem(body), // 渲染列表项
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
