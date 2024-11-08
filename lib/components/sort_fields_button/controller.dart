import 'package:get/get.dart';

// 排序规则
class SortFieldsController {
  final sortField = {}.obs;

  SortFieldsController(initSortField) {
    sortField.value = initSortField;
  }

  void setSortField(newSortField) {
    sortField.value = newSortField;
  }
}
