import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 综合页面
class GeneralView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  const GeneralView({super.key, required this.searchController});

  @override
  State<GeneralView> createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    ever(widget.searchController.searchText, (_) {
      print('搜索值：$_');
    });

    return InfinityScroll(
      fetcher: Http.client.searchUsingPOST,
      searchParams: const {
        "pageSize": 12,
        "sortOrder": "descend",
        "sortField": "_score",
        "tags": [],
        "searchText": "java学习路线",
        "current": 1,
        "reviewStatus": 1,
        "hiddenContent": true,
        "type": "all"
      },
      isGeneralSearch: true,
      itemRender: (data) => renderItem(data),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
