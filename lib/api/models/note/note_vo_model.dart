import 'package:codefather_app/api/models/note/note_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_vo_model.g.dart';

@JsonSerializable()
class NoteVoModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  NoteModel data;
  @JsonKey(name: "message")
  String message;

  NoteVoModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory NoteVoModel.fromJson(Map<String, dynamic> json) =>
      _$NoteVoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteVoModelToJson(this);
}
