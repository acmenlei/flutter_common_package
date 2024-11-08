import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';

/// 简历页面
class ResumeSearchView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  const ResumeSearchView({super.key, required this.searchController});

  @override
  State<ResumeSearchView> createState() => _ResumeSearchViewState();
}

class _ResumeSearchViewState extends State<ResumeSearchView>
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
        "type": "resume"
      },
      isGeneralSearch: true,
      itemRender: (data) => renderItem(data),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
