import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';

/// 问答页面
class QaSearchView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  const QaSearchView({super.key, required this.searchController});

  @override
  State<QaSearchView> createState() => _QaSearchViewState();
}

class _QaSearchViewState extends State<QaSearchView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return InfinityScroll(
      fetcher: Http.client.searchUsingPOST,
      searchParams: const {
        "pageSize": 12,
        "sortOrder": "descend",
        "sortField": "_score",
        "tags": [],
        "searchText": "",
        "current": 1,
        "reviewStatus": 1,
        "hiddenContent": true,
        "type": "qa"
      },
      isGeneralSearch: true,
      itemRender: (data) => renderItem(data),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
