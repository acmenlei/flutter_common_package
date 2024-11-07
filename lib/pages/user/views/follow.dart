import 'package:codefather_app/api/models/user_model.dart';
import 'package:codefather_app/components/user_info/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';

/// 用户帖子页
class UserFollowView extends StatefulWidget {
  final UserModel? user;
  const UserFollowView({super.key, this.user});

  @override
  State<UserFollowView> createState() => _UserFollowViewState();
}

class _UserFollowViewState extends State<UserFollowView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfinityScroll(
      fetcher: Http.client.listFollowPageUsingPOST, // 获取数据的接口
      searchParams: {
        "current": 1,
        "pageSize": 10,
        "sortField": "createTime",
        "sortOrder": "descend",
        "userId": widget.user?.id
      }, // 搜索条件
      itemRender: (body) => UserInfo(user: body,), // 渲染列表项
      padding: const EdgeInsets.only(bottom: 16),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
