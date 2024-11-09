// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString?);

import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_model.g.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String? postModelToJson(PostModel data) => json.encode(data.toJson());

@JsonSerializable()
class PostModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  dynamic title;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "plainTextDescription")
  dynamic plainTextDescription;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "cover")
  dynamic cover;
  @JsonKey(name: "thumbnailCover")
  dynamic thumbnailCover;
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
  @JsonKey(name: "tags")
  List<String>? tags;
  @JsonKey(name: "fileList")
  List<dynamic>? fileList;
  @JsonKey(name: "videoList")
  List<dynamic>? videoList;
  @JsonKey(name: "atUserList")
  List<dynamic>? atUserList;
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
  @JsonKey(name: "user")
  UserModel? user;

  PostModel({
    required this.user,
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.plainTextDescription,
    required this.category,
    required this.cover,
    required this.thumbnailCover,
    required this.language,
    required this.externalLink,
    required this.shortLink,
    required this.componentName,
    required this.viewNum,
    required this.thumbNum,
    required this.favourNum,
    required this.commentNum,
    required this.priority,
    required this.userId,
    required this.planetPostId,
    required this.relatedId,
    required this.showPost,
    required this.reviewStatus,
    required this.reviewMessage,
    required this.reviewerId,
    required this.reviewTime,
    required this.editTime,
    required this.createTime,
    required this.updateTime,
    required this.accessScope,
    required this.tags,
    required this.fileList,
    required this.videoList,
    required this.atUserList,
    required this.pictureList,
    required this.hasThumb,
    required this.hasFavour,
    required this.needVip,
    required this.atUserVoList,
    required this.status,
    required this.relatedLink,
    required this.acceptAnswerId,
    required this.bestComment,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String?, dynamic> toJson() => _$PostModelToJson(this);
}
