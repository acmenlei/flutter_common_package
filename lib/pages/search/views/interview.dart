import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';

/// 面试题页面
class InterviewSearchView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  const InterviewSearchView({super.key, required this.searchController});

  @override
  State<InterviewSearchView> createState() => _InterviewSearchViewState();
}

class _InterviewSearchViewState extends State<InterviewSearchView>
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
        "type": "question"
      },
      isGeneralSearch: true,
      itemRender: (data) => renderItem(data),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
