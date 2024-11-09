import 'package:codefather_app/api/models/post/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_page_model.g.dart';

@JsonSerializable()
class SearchPageList {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  SearchPage data;
  @JsonKey(name: "message")
  String message;

  SearchPageList({
    required this.code,
    required this.data,
    required this.message,
  });

  factory SearchPageList.fromJson(Map<String, dynamic> json) =>
      _$SearchPageListFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPageListToJson(this);
}

@JsonSerializable()
class SearchPage {
  @JsonKey(name: "searchPage")
  ResponseQaRecords searchPage;

  SearchPage({
    required this.searchPage,
  });

  factory SearchPage.fromJson(Map<String, dynamic> json) =>
      _$SearchPageFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPageToJson(this);
}

@JsonSerializable()
class ResponseQaRecords {
  @JsonKey(name: "records")
  List<PostModel>? records;
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "size")
  String? size;
  @JsonKey(name: "current")
  String? current;
  @JsonKey(name: "orders")
  List<dynamic>? orders;
  @JsonKey(name: "optimizeCountSql")
  bool? optimizeCountSql;
  @JsonKey(name: "searchCount")
  bool? searchCount;
  @JsonKey(name: "countId")
  dynamic countId;
  @JsonKey(name: "maxLimit")
  dynamic maxLimit;
  @JsonKey(name: "pages")
  String? pages;

  ResponseQaRecords({
    required this.records,
    required this.total,
    required this.size,
    required this.current,
    required this.orders,
    required this.optimizeCountSql,
    required this.searchCount,
    required this.countId,
    required this.maxLimit,
    required this.pages,
  });

  factory ResponseQaRecords.fromJson(Map<String, dynamic> json) =>
      _$ResponseQaRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseQaRecordsToJson(this);
}
