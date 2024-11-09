import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list_model.g.dart';

@JsonSerializable()
class UserModelList {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  ResponseUserRecords data;
  @JsonKey(name: "message")
  String message;

  UserModelList({
    required this.code,
    required this.data,
    required this.message,
  });

  factory UserModelList.fromJson(Map<String, dynamic> json) =>
      _$UserModelListFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelListToJson(this);
}

@JsonSerializable()
class ResponseUserRecords {
  @JsonKey(name: "records")
  List<UserModel>? records;
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

  ResponseUserRecords({
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

  factory ResponseUserRecords.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUserRecordsToJson(this);
}
