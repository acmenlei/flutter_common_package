import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/utils/render_item.dart';

// 关注视图
class FollowView extends StatefulWidget {
  const FollowView({super.key});

  @override
  State<FollowView> createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return InfinityScroll(
      fetcher: Http.client.getFollowPosts, // 获取数据的接口
      searchParams: const {
        "reviewStatus": 1,
        "current": 1,
        "needNotInterests": true,
        "hiddenContent": true,
        "sorterList": [
          {"field": "createTime", "asc": false}
        ]
      }, // 搜索条件
      itemRender: (body) => renderItem(body), // 渲染列表项
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
