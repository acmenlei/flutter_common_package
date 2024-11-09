import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qa_model.g.dart';

@JsonSerializable()
class QaModel {
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

    QaModel({
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

    factory QaModel.fromJson(Map<String, dynamic> json) => _$QaModelFromJson(json);

    Map<String, dynamic> toJson() => _$QaModelToJson(this);
}

@JsonSerializable()
class BestCommentModel {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "targetType")
    int? targetType;
    @JsonKey(name: "targetId")
    String? targetId;
    @JsonKey(name: "content")
    dynamic content;
    @JsonKey(name: "plainTextDescription")
    String? plainTextDescription;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "contentType")
    int? contentType;
    @JsonKey(name: "thumbNum")
    int? thumbNum;
    @JsonKey(name: "reviewStatus")
    dynamic reviewStatus;
    @JsonKey(name: "reviewMessage")
    dynamic reviewMessage;
    @JsonKey(name: "reviewerId")
    dynamic reviewerId;
    @JsonKey(name: "reviewTime")
    dynamic reviewTime;
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
    dynamic hasThumb;
    @JsonKey(name: "replyVOPage")
    dynamic replyVoPage;
    @JsonKey(name: "needVip")
    dynamic needVip;
    @JsonKey(name: "postVO")
    dynamic postVo;
    @JsonKey(name: "atUserList")
    dynamic atUserList;
    @JsonKey(name: "atUserVOList")
    dynamic atUserVoList;
    @JsonKey(name: "pictureList")
    dynamic pictureList;
    @JsonKey(name: "courseArticleVO")
    dynamic courseArticleVo;
    @JsonKey(name: "qaVO")
    QaModel? qaVo;

    BestCommentModel({
        this.id,
        this.targetType,
        this.targetId,
        this.content,
        this.plainTextDescription,
        this.type,
        this.contentType,
        this.thumbNum,
        this.reviewStatus,
        this.reviewMessage,
        this.reviewerId,
        this.reviewTime,
        this.priority,
        this.userId,
        this.planetUserId,
        this.createTime,
        this.updateTime,
        this.postId,
        this.user,
        this.hasThumb,
        this.replyVoPage,
        this.needVip,
        this.postVo,
        this.atUserList,
        this.atUserVoList,
        this.pictureList,
        this.courseArticleVo,
        this.qaVo,
    });

    factory BestCommentModel.fromJson(Map<String, dynamic> json) => _$BestCommentModelFromJson(json);

    Map<String, dynamic> toJson() => _$BestCommentModelToJson(this);
}