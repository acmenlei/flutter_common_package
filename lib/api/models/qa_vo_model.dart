import 'package:codefather_app/api/models/qa_model.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qa_vo_model.g.dart';

@JsonSerializable()
class QaVoModelRecord {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  QaVoModel data;
  @JsonKey(name: "message")
  String message;

  QaVoModelRecord({
    required this.code,
    required this.data,
    required this.message,
  });

  factory QaVoModelRecord.fromJson(Map<String, dynamic> json) =>
      _$QaVoModelRecordFromJson(json);

  Map<String, dynamic> toJson() => _$QaVoModelRecordToJson(this);
}

@JsonSerializable()
class QaVoModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "content")
  dynamic content;
  @JsonKey(name: "plainTextDescription")
  String? plainTextDescription;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "relatedLink")
  dynamic relatedLink;
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
  @JsonKey(name: "accessScope")
  int? accessScope;
  @JsonKey(name: "acceptAnswerId")
  dynamic acceptAnswerId;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "reviewStatus")
  int? reviewStatus;
  @JsonKey(name: "reviewMessage")
  String? reviewMessage;
  @JsonKey(name: "reviewerId")
  dynamic reviewerId;
  @JsonKey(name: "reviewTime")
  dynamic reviewTime;
  @JsonKey(name: "editTime")
  int? editTime;
  @JsonKey(name: "createTime")
  int? createTime;
  @JsonKey(name: "updateTime")
  int? updateTime;
  @JsonKey(name: "tags")
  List<String>? tags;
  @JsonKey(name: "bestComment")
  BestCommentModel? bestComment;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "hasThumb")
  bool? hasThumb;
  @JsonKey(name: "hasFavour")
  bool? hasFavour;
  @JsonKey(name: "hasUpdateAuth")
  bool? hasUpdateAuth;

  QaVoModel({
    this.id,
    this.title,
    this.content,
    this.plainTextDescription,
    this.category,
    this.status,
    this.relatedLink,
    this.viewNum,
    this.viewCount,
    this.thumbNum,
    this.favourNum,
    this.commentNum,
    this.priority,
    this.accessScope,
    this.acceptAnswerId,
    this.userId,
    this.reviewStatus,
    this.reviewMessage,
    this.reviewerId,
    this.reviewTime,
    this.editTime,
    this.createTime,
    this.updateTime,
    this.tags,
    this.bestComment,
    this.user,
    this.hasThumb,
    this.hasFavour,
    this.hasUpdateAuth,
  });

  factory QaVoModel.fromJson(Map<String, dynamic> json) =>
      _$QaVoModelFromJson(json);

  Map<String, dynamic> toJson() => _$QaVoModelToJson(this);
}
