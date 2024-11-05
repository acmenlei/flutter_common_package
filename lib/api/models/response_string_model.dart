import 'package:json_annotation/json_annotation.dart';

part 'response_string_model.g.dart';

@JsonSerializable()
class ResponseStringModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  String data;
  @JsonKey(name: "message")
  String message;

  ResponseStringModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory ResponseStringModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseStringModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStringModelToJson(this);
}
