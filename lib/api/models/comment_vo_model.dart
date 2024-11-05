import 'package:codefather_app/api/models/comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_vo_model.g.dart';

@JsonSerializable()
class CommentVoModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  CommentVo data;
  @JsonKey(name: "message")
  String message;

  CommentVoModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory CommentVoModel.fromJson(Map<String, dynamic> json) =>
      _$CommentVoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentVoModelToJson(this);
}