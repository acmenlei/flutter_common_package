// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'essay_vo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EssayVoModelRecord _$EssayVoModelRecordFromJson(Map<String, dynamic> json) =>
    EssayVoModelRecord(
      code: (json['code'] as num).toInt(),
      data: EssayVoModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$EssayVoModelRecordToJson(EssayVoModelRecord instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

EssayVoModel _$EssayVoModelFromJson(Map<String, dynamic> json) => EssayVoModel(
      id: json['id'] as String?,
      title: json['title'],
      description: json['description'],
      content: json['content'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cover: json['cover'],
      pictureList: json['pictureList'] as List<dynamic>?,
      fileList: json['fileList'] as List<dynamic>?,
      videoList: json['videoList'] as List<dynamic>?,
      atUserList: json['atUserList'] as List<dynamic>?,
      atUserVoList: json['atUserVOList'],
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      favourNum: (json['favourNum'] as num?)?.toInt(),
      commentNum: (json['commentNum'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      accessScope: (json['accessScope'] as num?)?.toInt(),
      clubId: json['clubId'] as String?,
      club: json['club'],
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      bestComment: json['bestComment'],
      viewNum: (json['viewNum'] as num?)?.toInt(),
      shortLink: json['shortLink'],
      hasThumb: json['hasThumb'] as bool?,
      hasFavour: json['hasFavour'] as bool?,
      showPost: (json['showPost'] as num?)?.toInt(),
      reviewStatus: (json['reviewStatus'] as num?)?.toInt(),
      reviewMessage: json['reviewMessage'] as String?,
      reviewerId: json['reviewerId'],
      reviewTime: (json['reviewTime'] as num?)?.toInt(),
      editTime: (json['editTime'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EssayVoModelToJson(EssayVoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'tags': instance.tags,
      'cover': instance.cover,
      'pictureList': instance.pictureList,
      'fileList': instance.fileList,
      'videoList': instance.videoList,
      'atUserList': instance.atUserList,
      'atUserVOList': instance.atUserVoList,
      'thumbNum': instance.thumbNum,
      'favourNum': instance.favourNum,
      'commentNum': instance.commentNum,
      'priority': instance.priority,
      'accessScope': instance.accessScope,
      'clubId': instance.clubId,
      'club': instance.club,
      'userId': instance.userId,
      'user': instance.user,
      'bestComment': instance.bestComment,
      'viewNum': instance.viewNum,
      'shortLink': instance.shortLink,
      'hasThumb': instance.hasThumb,
      'hasFavour': instance.hasFavour,
      'showPost': instance.showPost,
      'reviewStatus': instance.reviewStatus,
      'reviewMessage': instance.reviewMessage,
      'reviewerId': instance.reviewerId,
      'reviewTime': instance.reviewTime,
      'editTime': instance.editTime,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };
