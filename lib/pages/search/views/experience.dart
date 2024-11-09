import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/components/sort_fields_button/index.dart';
import 'package:codefather_app/pages/search/controller.dart';
import 'package:codefather_app/utils/render_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 面经页面
class ExperienceSearchView extends StatefulWidget {
  final GeneralSearchPageController searchController;
  final int index;
  const ExperienceSearchView(
      {super.key, required this.searchController, required this.index});

  @override
  State<ExperienceSearchView> createState() => _ExperienceSearchViewState();
}

class _ExperienceSearchViewState extends State<ExperienceSearchView>
    with AutomaticKeepAliveClientMixin {
  // 排序字段
  final sortFields = [
    {"label": '推荐', "value": '_score', "params": {}},
    {"label": '最新', "value": 'createTime', "params": {}},
    {"label": '最热', "value": 'thumbNum', "params": {}},
    {
      "label": '精选',
      "value": '_score',
      "params": {"priority": 999}
    },
  ];
  RxMap<String, dynamic> curSortField =
      {"label": '推荐', "value": '_score', "params": {}}.obs;

  @override
  void initState() {
    // 初始化排序字段
    curSortField.value = sortFields[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SortFieldsButton(
          sortFields: sortFields,
          curSortField: curSortField,
          onSortFieldChange: (sf) => curSortField.value = sf,
        ),
        Expanded(
          child: Obx(
            () => InfinityScroll(
              fetcher: Http.client.searchUsingPOST,
              searchParams: {
                "pageSize": 12,
                "sortOrder": "descend",
                "sortField": curSortField["value"], // 排序字段
                "tags": const [],
                "searchText": Get.arguments?["keyword"] ?? '',
                "current": 1,
                "reviewStatus": 1,
                "hiddenContent": true,
                "type": "experience",
              },
              isGeneralSearch: true,
              itemRender: (data) => renderItem(data),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
