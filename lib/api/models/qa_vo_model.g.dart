// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qa_vo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QaVoModel _$QaVoModelFromJson(Map<String, dynamic> json) => QaVoModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      content: json['content'],
      plainTextDescription: json['plainTextDescription'] as String?,
      category: json['category'] as String?,
      status: (json['status'] as num?)?.toInt(),
      relatedLink: json['relatedLink'],
      viewNum: (json['viewNum'] as num?)?.toInt(),
      viewCount: json['viewCount'] as String?,
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      favourNum: (json['favourNum'] as num?)?.toInt(),
      commentNum: (json['commentNum'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      accessScope: (json['accessScope'] as num?)?.toInt(),
      acceptAnswerId: json['acceptAnswerId'],
      userId: json['userId'] as String?,
      reviewStatus: (json['reviewStatus'] as num?)?.toInt(),
      reviewMessage: json['reviewMessage'] as String?,
      reviewerId: json['reviewerId'],
      reviewTime: json['reviewTime'],
      editTime: (json['editTime'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bestComment: json['bestComment'] == null
          ? null
          : BestCommentModel.fromJson(
              json['bestComment'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      hasThumb: json['hasThumb'] as bool?,
      hasFavour: json['hasFavour'] as bool?,
      hasUpdateAuth: json['hasUpdateAuth'] as bool?,
    );

Map<String, dynamic> _$QaVoModelToJson(QaVoModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'plainTextDescription': instance.plainTextDescription,
      'category': instance.category,
      'status': instance.status,
      'relatedLink': instance.relatedLink,
      'viewNum': instance.viewNum,
      'viewCount': instance.viewCount,
      'thumbNum': instance.thumbNum,
      'favourNum': instance.favourNum,
      'commentNum': instance.commentNum,
      'priority': instance.priority,
      'accessScope': instance.accessScope,
      'acceptAnswerId': instance.acceptAnswerId,
      'userId': instance.userId,
      'reviewStatus': instance.reviewStatus,
      'reviewMessage': instance.reviewMessage,
      'reviewerId': instance.reviewerId,
      'reviewTime': instance.reviewTime,
      'editTime': instance.editTime,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'tags': instance.tags,
      'bestComment': instance.bestComment,
      'user': instance.user,
      'hasThumb': instance.hasThumb,
      'hasFavour': instance.hasFavour,
      'hasUpdateAuth': instance.hasUpdateAuth,
    };

BestCommentModel _$BestCommentModelFromJson(Map<String, dynamic> json) =>
    BestCommentModel(
      id: json['id'] as String?,
      targetType: (json['targetType'] as num?)?.toInt(),
      targetId: json['targetId'] as String?,
      content: json['content'],
      plainTextDescription: json['plainTextDescription'] as String?,
      type: json['type'] as String?,
      contentType: (json['contentType'] as num?)?.toInt(),
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      reviewStatus: json['reviewStatus'],
      reviewMessage: json['reviewMessage'],
      reviewerId: json['reviewerId'],
      reviewTime: json['reviewTime'],
      priority: (json['priority'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      planetUserId: json['planetUserId'],
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      postId: json['postId'],
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      hasThumb: json['hasThumb'],
      replyVoPage: json['replyVOPage'],
      needVip: json['needVip'],
      postVo: json['postVO'],
      atUserList: json['atUserList'],
      atUserVoList: json['atUserVOList'],
      pictureList: json['pictureList'],
      courseArticleVo: json['courseArticleVO'],
      qaVo: json['qaVO'] == null
          ? null
          : QaVoModel.fromJson(json['qaVO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BestCommentModelToJson(BestCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetType': instance.targetType,
      'targetId': instance.targetId,
      'content': instance.content,
      'plainTextDescription': instance.plainTextDescription,
      'type': instance.type,
      'contentType': instance.contentType,
      'thumbNum': instance.thumbNum,
      'reviewStatus': instance.reviewStatus,
      'reviewMessage': instance.reviewMessage,
      'reviewerId': instance.reviewerId,
      'reviewTime': instance.reviewTime,
      'priority': instance.priority,
      'userId': instance.userId,
      'planetUserId': instance.planetUserId,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'postId': instance.postId,
      'user': instance.user,
      'hasThumb': instance.hasThumb,
      'replyVOPage': instance.replyVoPage,
      'needVip': instance.needVip,
      'postVO': instance.postVo,
      'atUserList': instance.atUserList,
      'atUserVOList': instance.atUserVoList,
      'pictureList': instance.pictureList,
      'courseArticleVO': instance.courseArticleVo,
      'qaVO': instance.qaVo,
    };
