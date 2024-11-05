// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_vo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostVoModelRecord _$PostVoModelRecordFromJson(Map<String, dynamic> json) =>
    PostVoModelRecord(
      code: (json['code'] as num).toInt(),
      data: PostVoModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$PostVoModelRecordToJson(PostVoModelRecord instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

PostVoModel _$PostVoModelFromJson(Map<String, dynamic> json) => PostVoModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      plainTextDescription: json['plainTextDescription'] as String?,
      category: json['category'] as String?,
      cover: json['cover'] as String?,
      thumbnailCover: json['thumbnailCover'] as String?,
      language: json['language'],
      externalLink: json['externalLink'],
      shortLink: json['shortLink'],
      componentName: json['componentName'],
      viewNum: (json['viewNum'] as num?)?.toInt(),
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      favourNum: (json['favourNum'] as num?)?.toInt(),
      commentNum: (json['commentNum'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      planetPostId: json['planetPostId'],
      relatedId: json['relatedId'],
      showPost: (json['showPost'] as num?)?.toInt(),
      reviewStatus: (json['reviewStatus'] as num?)?.toInt(),
      reviewMessage: json['reviewMessage'] as String?,
      reviewerId: json['reviewerId'],
      reviewTime: (json['reviewTime'] as num?)?.toInt(),
      editTime: (json['editTime'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      accessScope: (json['accessScope'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      fileList: json['fileList'],
      videoList: json['videoList'] as List<dynamic>?,
      atUserList: json['atUserList'],
      pictureList: (json['pictureList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasThumb: json['hasThumb'] as bool?,
      hasFavour: json['hasFavour'] as bool?,
      needVip: json['needVip'],
      atUserVoList: json['atUserVOList'],
      status: json['status'],
      relatedLink: json['relatedLink'],
      acceptAnswerId: json['acceptAnswerId'],
      bestComment: json['bestComment'],
    );

Map<String, dynamic> _$PostVoModelToJson(PostVoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'plainTextDescription': instance.plainTextDescription,
      'category': instance.category,
      'cover': instance.cover,
      'thumbnailCover': instance.thumbnailCover,
      'language': instance.language,
      'externalLink': instance.externalLink,
      'shortLink': instance.shortLink,
      'componentName': instance.componentName,
      'viewNum': instance.viewNum,
      'thumbNum': instance.thumbNum,
      'favourNum': instance.favourNum,
      'commentNum': instance.commentNum,
      'priority': instance.priority,
      'userId': instance.userId,
      'planetPostId': instance.planetPostId,
      'relatedId': instance.relatedId,
      'showPost': instance.showPost,
      'reviewStatus': instance.reviewStatus,
      'reviewMessage': instance.reviewMessage,
      'reviewerId': instance.reviewerId,
      'reviewTime': instance.reviewTime,
      'editTime': instance.editTime,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'accessScope': instance.accessScope,
      'user': instance.user,
      'tags': instance.tags,
      'fileList': instance.fileList,
      'videoList': instance.videoList,
      'atUserList': instance.atUserList,
      'pictureList': instance.pictureList,
      'hasThumb': instance.hasThumb,
      'hasFavour': instance.hasFavour,
      'needVip': instance.needVip,
      'atUserVOList': instance.atUserVoList,
      'status': instance.status,
      'relatedLink': instance.relatedLink,
      'acceptAnswerId': instance.acceptAnswerId,
      'bestComment': instance.bestComment,
    };
