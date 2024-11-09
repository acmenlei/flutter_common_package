import 'package:codefather_app/api/models/post/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable()
class PostModelList {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  ResponseRecords data;
  @JsonKey(name: "message")
  String message;

  PostModelList({
    required this.code,
    required this.data,
    required this.message,
  });

  factory PostModelList.fromJson(Map<String, dynamic> json) =>
      _$PostModelListFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelListToJson(this);
}

@JsonSerializable()
class ResponseRecords {
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

  ResponseRecords({
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

  factory ResponseRecords.fromJson(Map<String, dynamic> json) =>
      _$ResponseRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseRecordsToJson(this);
}
