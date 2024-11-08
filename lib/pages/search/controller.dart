import 'package:get/get.dart';

class GeneralSearchPageController {
  final searchText = ''.obs;
  final tabIndex = 0.obs; // 默认在综合
  final sortField = 'createTime'.obs;
  final sortFields = [
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
  ].obs;

  // 设置搜索关键词
  onSearchTextChange(String text) {
    searchText.value = text;
  }

  // 更新排序字段
  setSortField(String value) {
    sortField.value = value;
  }

  // 更新sortFields
  setSortFieldList(List<Map<String, String>> fields) {
    sortFields.value = fields;
  }

  // 切换tab
  onTabChange(int index) {
    tabIndex.value = index;
  }
}
