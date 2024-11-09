import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_vo_model.g.dart';

@JsonSerializable()
class NoteVoModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "plainTextDescription")
  String? plainTextDescription;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "viewNum")
  int? viewNum;
  @JsonKey(name: "viewCount")
  String? viewCount;
  @JsonKey(name: "thumbNum")
  int? thumbNum;
  @JsonKey(name: "favourNum")
  int? favourNum;
  @JsonKey(name: "commentNum")
  int? commentNum;
  @JsonKey(name: "priority")
  int? priority;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "reviewStatus")
  int? reviewStatus;
  @JsonKey(name: "reviewMessage")
  dynamic reviewMessage;
  @JsonKey(name: "reviewerId")
  dynamic reviewerId;
  @JsonKey(name: "reviewTime")
  int? reviewTime;
  @JsonKey(name: "editTime")
  int? editTime;
  @JsonKey(name: "createTime")
  int? createTime;
  @JsonKey(name: "updateTime")
  int? updateTime;
  @JsonKey(name: "accessScope")
  int? accessScope;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "tags")
  List<String>? tags;
  @JsonKey(name: "hasThumb")
  bool? hasThumb;
  @JsonKey(name: "hasFavour")
  bool? hasFavour;
  @JsonKey(name: "status")
  dynamic status;

  NoteVoModel({
    this.id,
    this.title,
    this.content,
    this.plainTextDescription,
    this.category,
    this.viewNum,
    this.viewCount,
    this.thumbNum,
    this.favourNum,
    this.commentNum,
    this.priority,
    this.userId,
    this.reviewStatus,
    this.reviewMessage,
    this.reviewerId,
    this.reviewTime,
    this.editTime,
    this.createTime,
    this.updateTime,
    this.accessScope,
    this.user,
    this.tags,
    this.hasThumb,
    this.hasFavour,
    this.status,
  });

  factory NoteVoModel.fromJson(Map<String, dynamic> json) =>
      _$NoteVoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteVoModelToJson(this);
}
