import 'package:get/get.dart';

class GeneralSearchPageController {
  final searchText = ''.obs;
  final sortField = 'createTime'.obs;

  List<Map<String, String>> sortFields = [
    {
      "label": '最新',
      "value": 'createTime',
    },
    {
      "label": '最热',
      "value": 'hot',
    },
    {
      "label": '精选',
      "value": 'good',
    },
  ];

  // 设置搜索关键词
  onSearchTextChange(String text) {
    searchText.value = text;
  }

  // 更新排序字段
  setSortField(String value) {
    sortField.value = value;
  }
}
