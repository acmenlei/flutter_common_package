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

  InfinityScrollController(fetch, defaultParams, isCursor) {
    fetcher = fetch; // 获取数据的方法
    searchParams = deepCopy(defaultParams); // 默认参数
    defaultSearchParams = defaultParams;
    isCursorSearch = isCursor; // 是否是游标查询
    doFetch();
  }

  doFetch() async {
    isLoading.value = true;
    searchParams = deepCopy(defaultSearchParams); // 重置参数
    try {
      final res = await fetcher(searchParams);
      if (res.code == 0) {
        total.value = int.parse(res.data.total.toString());
        data.value = res.data.records ?? [];
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
      if (res.data.records?.isEmpty == true) {
        return false;
      }
      if (res.code == 0) {
        total.value = int.parse(res.data.total.toString());
        data.value = [...data, ...(res.data.records ?? [])];
      }
    } catch (e) {
      // print(e);
    }
    isLoading.value = false;
    return data.length < total.value; // 是否还有更多数据
  }
}
