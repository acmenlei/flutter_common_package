import 'package:codefather_app/api/models/post_model.dart';
import 'package:codefather_app/api/models/qa_vo_model.dart';
import 'package:codefather_app/api/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentListModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  CommentVoPage? data;
  @JsonKey(name: "message")
  String message;

  CommentListModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory CommentListModel.fromJson(Map<String, dynamic> json) =>
      _$CommentListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentListModelToJson(this);
}

@JsonSerializable()
class CommentVoPage {
  @JsonKey(name: "records")
  List<CommentVo> records;
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "size")
  String? size;
  @JsonKey(name: "current")
  String? current;
  @JsonKey(name: "orders")
  List<dynamic>? orders;
  @JsonKey(name: "optimizeCountSql")
  bool? optimizeCountSql;
  @JsonKey(name: "searchCount")
  bool? searchCount;
  @JsonKey(name: "countId")
  dynamic countId;
  @JsonKey(name: "maxLimit")
  dynamic maxLimit;
  @JsonKey(name: "pages")
  String? pages;

  CommentVoPage({
    required this.records,
    required this.total,
    required this.size,
    required this.current,
    required this.orders,
    required this.optimizeCountSql,
    required this.searchCount,
    required this.countId,
    required this.maxLimit,
    required this.pages,
  });

  factory CommentVoPage.fromJson(Map<String, dynamic> json) =>
      _$CommentVoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CommentVoPageToJson(this);
}

@JsonSerializable()
class CommentVo {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "targetType")
  int? targetType;
  @JsonKey(name: "targetId")
  String? targetId;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "plainTextDescription")
  dynamic plainTextDescription;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "contentType")
  int? contentType;
  @JsonKey(name: "thumbNum")
  int? thumbNum;
  @JsonKey(name: "reviewStatus")
  int? reviewStatus;
  @JsonKey(name: "reviewMessage")
  dynamic reviewMessage;
  @JsonKey(name: "reviewerId")
  dynamic reviewerId;
  @JsonKey(name: "reviewTime")
  int? reviewTime;
  @JsonKey(name: "priority")
  int? priority;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "planetUserId")
  dynamic planetUserId;
  @JsonKey(name: "createTime")
  int? createTime;
  @JsonKey(name: "updateTime")
  int? updateTime;
  @JsonKey(name: "postId")
  dynamic postId;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "hasThumb")
  bool? hasThumb;
  @JsonKey(name: "replyVOPage")
  ReplyVoPage? replyVoPage;
  @JsonKey(name: "needVip")
  dynamic needVip;
  @JsonKey(name: "postVO")
  PostModel? postVo;
  @JsonKey(name: "atUserList")
  List<dynamic>? atUserList;
  @JsonKey(name: "atUserVOList")
  dynamic atUserVoList;
  @JsonKey(name: "pictureList")
  List<dynamic>? pictureList;
  @JsonKey(name: "courseArticleVO")
  dynamic courseArticleVo;
  @JsonKey(name: "qaVO")
  QaVoModel? qaVo;

  CommentVo({
    required this.id,
    required this.targetType,
    required this.targetId,
    required this.content,
    required this.plainTextDescription,
    required this.type,
    required this.contentType,
    required this.thumbNum,
    required this.reviewStatus,
    required this.reviewMessage,
    required this.reviewerId,
    required this.reviewTime,
    required this.priority,
    required this.userId,
    required this.planetUserId,
    required this.createTime,
    required this.updateTime,
    required this.postId,
    required this.user,
    required this.hasThumb,
    required this.replyVoPage,
    required this.needVip,
    required this.postVo,
    required this.atUserList,
    required this.atUserVoList,
    required this.pictureList,
    required this.courseArticleVo,
    required this.qaVo,
  });

  factory CommentVo.fromJson(Map<String, dynamic> json) =>
      _$CommentVoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentVoToJson(this);
}

@JsonSerializable()
class ReplyVoPage {
  @JsonKey(name: "records")
  List<ReplyVo>? records;
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "size")
  String? size;
  @JsonKey(name: "current")
  String? current;
  @JsonKey(name: "orders")
  List<dynamic>? orders;
  @JsonKey(name: "optimizeCountSql")
  bool? optimizeCountSql;
  @JsonKey(name: "searchCount")
  bool? searchCount;
  @JsonKey(name: "countId")
  dynamic countId;
  @JsonKey(name: "maxLimit")
  dynamic maxLimit;
  @JsonKey(name: "pages")
  String? pages;

  ReplyVoPage({
    required this.records,
    required this.total,
    required this.size,
    required this.current,
    required this.orders,
    required this.optimizeCountSql,
    required this.searchCount,
    required this.countId,
    required this.maxLimit,
    required this.pages,
  });

  factory ReplyVoPage.fromJson(Map<String, dynamic> json) =>
      _$ReplyVoPageFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyVoPageToJson(this);
}

@JsonSerializable()
class ReplyVo {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "postId")
  dynamic postId;
  @JsonKey(name: "targetType")
  int? targetType;
  @JsonKey(name: "targetId")
  String? targetId;
  @JsonKey(name: "commentId")
  String? commentId;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "contentType")
  int? contentType;
  @JsonKey(name: "replyId")
  String? replyId;
  @JsonKey(name: "replyUserId")
  String? replyUserId;
  @JsonKey(name: "replyPlanetUserId")
  dynamic replyPlanetUserId;
  @JsonKey(name: "planetUserId")
  dynamic planetUserId;
  @JsonKey(name: "thumbNum")
  int? thumbNum;
  @JsonKey(name: "reviewStatus")
  int? reviewStatus;
  @JsonKey(name: "reviewMessage")
  dynamic reviewMessage;
  @JsonKey(name: "reviewerId")
  dynamic reviewerId;
  @JsonKey(name: "reviewTime")
  int? reviewTime;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "createTime")
  int? createTime;
  @JsonKey(name: "updateTime")
  int? updateTime;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "replyUser")
  UserModel? replyUser;
  @JsonKey(name: "hasThumb")
  bool? hasThumb;
  @JsonKey(name: "atUserList")
  List<dynamic>? atUserList;
  @JsonKey(name: "atUserVOList")
  dynamic atUserVoList;
  @JsonKey(name: "pictureList")
  List<dynamic>? pictureList;

  ReplyVo({
    required this.id,
    required this.postId,
    required this.targetType,
    required this.targetId,
    required this.commentId,
    required this.content,
    required this.contentType,
    required this.replyId,
    required this.replyUserId,
    required this.replyPlanetUserId,
    required this.planetUserId,
    required this.thumbNum,
    required this.reviewStatus,
    required this.reviewMessage,
    required this.reviewerId,
    required this.reviewTime,
    required this.userId,
    required this.createTime,
    required this.updateTime,
    required this.user,
    required this.replyUser,
    required this.hasThumb,
    required this.atUserList,
    required this.atUserVoList,
    required this.pictureList,
  });

  factory ReplyVo.fromJson(Map<String, dynamic> json) =>
      _$ReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyVoToJson(this);
}