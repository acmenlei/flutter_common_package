import 'package:codefather_app/api/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/utils/render_item.dart';

/// 用户帖子页
class UserPostView extends StatefulWidget {
  final UserModel? user;
  const UserPostView({super.key, this.user});

  @override
  State<UserPostView> createState() => _UserPostViewState();
}

class _UserPostViewState extends State<UserPostView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfinityScroll(
      fetcher: Http.client.getPosts, // 获取数据的接口
      searchParams: {
        "current": 1,
        "pageSize": 10,
        "sortField": "createTime",
        "sortOrder": "descend",
        "hiddenContent": true,
        "userId": widget.user?.id
      }, // 搜索条件
      itemRender: (body) => renderItem(body), // 渲染列表项
    );
  }

  @override
  bool get wantKeepAlive => true;
}
