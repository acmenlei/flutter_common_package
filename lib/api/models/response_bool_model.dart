import 'package:json_annotation/json_annotation.dart';

part 'response_bool_model.g.dart';

@JsonSerializable()
class ResponseBoolModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  bool? data;
  @JsonKey(name: "message")
  String message;

  ResponseBoolModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory ResponseBoolModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseBoolModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseBoolModelToJson(this);
}
