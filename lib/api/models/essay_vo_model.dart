import 'package:codefather_app/api/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'essay_vo_model.g.dart';
@JsonSerializable()
class EssayVoModelRecord {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  EssayVoModel data;
  @JsonKey(name: "message")
  String message;

  EssayVoModelRecord({
    required this.code,
    required this.data,
    required this.message,
  });

  factory EssayVoModelRecord.fromJson(Map<String, dynamic> json) =>
      _$EssayVoModelRecordFromJson(json);

  Map<String, dynamic> toJson() => _$EssayVoModelRecordToJson(this);
}

@JsonSerializable()
class EssayVoModel {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "title")
    dynamic title;
    @JsonKey(name: "description")
    dynamic description;
    @JsonKey(name: "content")
    String? content;
    @JsonKey(name: "tags")
    List<String>? tags;
    @JsonKey(name: "cover")
    dynamic cover;
    @JsonKey(name: "pictureList")
    List<dynamic>? pictureList;
    @JsonKey(name: "fileList")
    List<dynamic>? fileList;
    @JsonKey(name: "videoList")
    List<dynamic>? videoList;
    @JsonKey(name: "atUserList")
    List<dynamic>? atUserList;
    @JsonKey(name: "atUserVOList")
    dynamic atUserVoList;
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
    @JsonKey(name: "clubId")
    String? clubId;
    @JsonKey(name: "club")
    dynamic club;
    @JsonKey(name: "userId")
    String? userId;
    @JsonKey(name: "user")
    UserModel? user;
    @JsonKey(name: "bestComment")
    dynamic bestComment;
    @JsonKey(name: "viewNum")
    int? viewNum;
    @JsonKey(name: "shortLink")
    dynamic shortLink;
    @JsonKey(name: "hasThumb")
    bool? hasThumb;
    @JsonKey(name: "hasFavour")
    bool? hasFavour;
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

    EssayVoModel({
        this.id,
        this.title,
        this.description,
        this.content,
        this.tags,
        this.cover,
        this.pictureList,
        this.fileList,
        this.videoList,
        this.atUserList,
        this.atUserVoList,
        this.thumbNum,
        this.favourNum,
        this.commentNum,
        this.priority,
        this.accessScope,
        this.clubId,
        this.club,
        this.userId,
        this.user,
        this.bestComment,
        this.viewNum,
        this.shortLink,
        this.hasThumb,
        this.hasFavour,
        this.showPost,
        this.reviewStatus,
        this.reviewMessage,
        this.reviewerId,
        this.reviewTime,
        this.editTime,
        this.createTime,
        this.updateTime,
    });

    factory EssayVoModel.fromJson(Map<String, dynamic> json) => _$EssayVoModelFromJson(json);

    Map<String, dynamic> toJson() => _$EssayVoModelToJson(this);
}