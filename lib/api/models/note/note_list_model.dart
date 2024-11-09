import 'package:codefather_app/api/models/note/note_vo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_list_model.g.dart';

@JsonSerializable()
class NoteModelList {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  ResponseNoteRecords data;
  @JsonKey(name: "message")
  String message;

  NoteModelList({
    required this.code,
    required this.data,
    required this.message,
  });

  factory NoteModelList.fromJson(Map<String, dynamic> json) =>
      _$NoteModelListFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelListToJson(this);
}

@JsonSerializable()
class ResponseNoteRecords {
  @JsonKey(name: "records")
  List<NoteVoModel>? records;
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

  ResponseNoteRecords({
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

  factory ResponseNoteRecords.fromJson(Map<String, dynamic> json) =>
      _$ResponseNoteRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseNoteRecordsToJson(this);
}
