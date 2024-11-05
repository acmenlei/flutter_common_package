import 'package:codefather_app/api/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_vo_model.g.dart';

@JsonSerializable()
class UserVoModelRecord {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  UserModel? data;
  @JsonKey(name: "message")
  String message;

  UserVoModelRecord({
    required this.code,
    required this.data,
    required this.message,
  });

  factory UserVoModelRecord.fromJson(Map<String, dynamic> json) =>
      _$UserVoModelRecordFromJson(json);

  Map<String, dynamic> toJson() => _$UserVoModelRecordToJson(this);
}
