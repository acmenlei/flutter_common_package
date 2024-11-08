import 'package:codefather_app/utils/index.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:get/get.dart';

/// 无限滚动参数【这里不需要继承 Getx】
class InfinityScrollController {
  RxList<dynamic> data = ([].obs);
  RxInt total = 0.obs;
  RxBool isLoading = false.obs;
  Map<String, dynamic> searchParams = {};
  Map<String, dynamic> defaultSearchParams = {};
  late Future<dynamic> Function(Map<String, dynamic> body) fetcher; // 获取数据的方法
  bool isCursorSearch = false;
  bool isGeneralSearch = false;

  InfinityScrollController(fetch, defaultParams, isCursor, isGS) {
    fetcher = fetch; // 获取数据的方法
    searchParams = deepCopy(defaultParams); // 默认参数
    defaultSearchParams = defaultParams;
    isCursorSearch = isCursor; // 是否是游标查询
    isGeneralSearch = isGS; // 是否是搜索查询【搜索在外面包了一层 searchPage 】
    doFetch();
  }

  doFetch() async {
    isLoading.value = true;
    searchParams = deepCopy(defaultSearchParams); // 重置参数
    try {
      final res = await fetcher(searchParams);
      final searchData = isGeneralSearch ? res.data.searchPage : res.data;
      if (res.code == 0) {
        // 判断是综合搜索接口查询还是普通查询
        if (isGeneralSearch) {
          total.value = int.parse(searchData.total.toString());
          data.value = searchData.records ?? [];
        } else {
          total.value = int.parse(searchData.total.toString());
          data.value = searchData.records ?? [];
        }
      }
    } catch (e) {
      LogUtil.e(e);
    }
    isLoading.value = false;
  }

  // 加载更多
  loadMore() async {
    if (isLoading.value) {
      return;
    }
    if (isCursorSearch) {
      searchParams["cursorList"] = [
        // 兼容首页
        {
          "field": 'createTime',
          "value":
              formatDateTimeStr(data[data.length - 1]?.createTime), // 当前最后一条数据
          "asc": false,
        },
        {
          "field": 'id',
          "value": data[data.length - 1]?.id,
          "asc": false,
        },
      ];
    } else {
      searchParams["current"] = searchParams["current"] + 1; // 页码查询
    }
    isLoading.value = true;
    try {
      final res = await fetcher(searchParams);
      final searchData = isGeneralSearch ? res.data.searchPage : res.data;
      if (searchData.records?.isEmpty == true) {
        return false;
      }
      if (res.code == 0) {
        // 判断是综合搜索还是普通查询
        if (isGeneralSearch) {
          total.value = int.parse(searchData.total.toString());
          data.value = [...data, ...(searchData.records ?? [])];
        } else {
          total.value = int.parse(searchData.total.toString());
          data.value = [...data, ...(searchData.records ?? [])];
        }
      }
    } catch (e) {
      // print(e);
    }
    isLoading.value = false;
    return data.length < total.value; // 是否还有更多数据
  }
}
