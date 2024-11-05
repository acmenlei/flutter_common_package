import 'package:json_annotation/json_annotation.dart';

part 'response_string_list_model.g.dart';

@JsonSerializable()
class ResponseStringListModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  List<String>? data;
  @JsonKey(name: "message")
  String message;

  ResponseStringListModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory ResponseStringListModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseStringListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStringListModelToJson(this);
}
