import 'package:get/get.dart';

class GeneralSearchPageController {
  final searchText = ''.obs;

  // 设置搜索关键词
  onSearchTextChange(String text) {
    searchText.value = text;
  }
}
