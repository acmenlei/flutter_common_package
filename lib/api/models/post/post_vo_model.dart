import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_vo_model.g.dart';

@JsonSerializable()
class PostVoModelRecord {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  PostVoModel data;
  @JsonKey(name: "message")
  String message;

  PostVoModelRecord({
    required this.code,
    required this.data,
    required this.message,
  });

  factory PostVoModelRecord.fromJson(Map<String, dynamic> json) =>
      _$PostVoModelRecordFromJson(json);

  Map<String, dynamic> toJson() => _$PostVoModelRecordToJson(this);
}

@JsonSerializable()
class PostVoModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "plainTextDescription")
  String? plainTextDescription;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "cover")
  String? cover;
  @JsonKey(name: "thumbnailCover")
  String? thumbnailCover;
  @JsonKey(name: "language")
  dynamic language;
  @JsonKey(name: "externalLink")
  dynamic externalLink;
  @JsonKey(name: "shortLink")
  dynamic shortLink;
  @JsonKey(name: "componentName")
  dynamic componentName;
  @JsonKey(name: "viewNum")
  int? viewNum;
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
  @JsonKey(name: "planetPostId")
  dynamic planetPostId;
  @JsonKey(name: "relatedId")
  dynamic relatedId;
  @JsonKey(name: "showPost")
  int? showPost;
  @JsonKey(name: "reviewStatus")
  int? reviewStatus;
  @JsonKey(name: "reviewMessage")
  String? reviewMessage;
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
  @JsonKey(name: "fileList")
  dynamic fileList;
  @JsonKey(name: "videoList")
  List<dynamic>? videoList;
  @JsonKey(name: "atUserList")
  dynamic atUserList;
  @JsonKey(name: "pictureList")
  List<String>? pictureList;
  @JsonKey(name: "hasThumb")
  bool? hasThumb;
  @JsonKey(name: "hasFavour")
  bool? hasFavour;
  @JsonKey(name: "needVip")
  dynamic needVip;
  @JsonKey(name: "atUserVOList")
  dynamic atUserVoList;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "relatedLink")
  dynamic relatedLink;
  @JsonKey(name: "acceptAnswerId")
  dynamic acceptAnswerId;
  @JsonKey(name: "bestComment")
  dynamic bestComment;

  PostVoModel({
    this.id,
    this.title,
    this.description,
    this.content,
    this.plainTextDescription,
    this.category,
    this.cover,
    this.thumbnailCover,
    this.language,
    this.externalLink,
    this.shortLink,
    this.componentName,
    this.viewNum,
    this.thumbNum,
    this.favourNum,
    this.commentNum,
    this.priority,
    this.userId,
    this.planetPostId,
    this.relatedId,
    this.showPost,
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
    this.fileList,
    this.videoList,
    this.atUserList,
    this.pictureList,
    this.hasThumb,
    this.hasFavour,
    this.needVip,
    this.atUserVoList,
    this.status,
    this.relatedLink,
    this.acceptAnswerId,
    this.bestComment,
  });

  factory PostVoModel.fromJson(Map<String, dynamic> json) =>
      _$PostVoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostVoModelToJson(this);
}
