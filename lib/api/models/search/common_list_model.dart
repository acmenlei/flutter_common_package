import 'package:codefather_app/api/models/search/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_list_model.g.dart';

@JsonSerializable()
class CommonList {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  ResponseCommonRecords data;
  @JsonKey(name: "message")
  String message;

  CommonList({
    required this.code,
    required this.data,
    required this.message,
  });

  factory CommonList.fromJson(Map<String, dynamic> json) =>
      _$CommonListFromJson(json);

  Map<String, dynamic> toJson() => _$CommonListToJson(this);
}

@JsonSerializable()
class ResponseCommonRecords {
  @JsonKey(name: "records")
  List<CommonModel>? records;
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

  ResponseCommonRecords({
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

  factory ResponseCommonRecords.fromJson(Map<String, dynamic> json) =>
      _$ResponseCommonRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCommonRecordsToJson(this);
}
