import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 文章页面
class PassageSearchView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  final int index;
  const PassageSearchView(
      {super.key, required this.searchController, required this.index});

  @override
  State<PassageSearchView> createState() => _PassageSearchViewState();
}

class _PassageSearchViewState extends State<PassageSearchView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    ever(widget.searchController.searchText, (v) {
      print("新值：$v");
    });

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
        "type": "passage"
      },
      isGeneralSearch: true,
      itemRender: (data) => renderItem(data),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
