import 'package:codefather_app/api/models/qa/qa_vo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qa_list_model.g.dart';

@JsonSerializable()
class QaModelList {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  ResponseQaRecords data;
  @JsonKey(name: "message")
  String message;

  QaModelList({
    required this.code,
    required this.data,
    required this.message,
  });

  factory QaModelList.fromJson(Map<String, dynamic> json) =>
      _$QaModelListFromJson(json);

  Map<String, dynamic> toJson() => _$QaModelListToJson(this);
}

@JsonSerializable()
class ResponseQaRecords {
  @JsonKey(name: "records")
  List<QaVoModel>? records;
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
