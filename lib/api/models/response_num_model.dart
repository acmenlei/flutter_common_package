import 'package:json_annotation/json_annotation.dart';

part 'response_num_model.g.dart';

@JsonSerializable()
class ResponseNumModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  int? data;
  @JsonKey(name: "message")
  String message;

  ResponseNumModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory ResponseNumModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseNumModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseNumModelToJson(this);
}
