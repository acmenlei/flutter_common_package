import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';

/// 用户页面
class UserSearchView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  const UserSearchView({super.key, required this.searchController});

  @override
  State<UserSearchView> createState() => _UserSearchViewState();
}

class _UserSearchViewState extends State<UserSearchView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return InfinityScroll(
      fetcher: Http.client.searchUsingPOST,
      searchParams: const {
        "pageSize": 12,
        "sortOrder": "descend",
        "tags": [],
        "searchText": "",
        "current": 1,
        "reviewStatus": 1,
        "hiddenContent": true,
        "type": "user"
      },
      isGeneralSearch: true,
      itemRender: (data) => renderItem(data),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
