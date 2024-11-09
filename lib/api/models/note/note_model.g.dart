// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      plainTextDescription: json['plainTextDescription'] as String?,
      category: json['category'] as String?,
      viewNum: (json['viewNum'] as num?)?.toInt(),
      viewCount: json['viewCount'] as String?,
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      favourNum: (json['favourNum'] as num?)?.toInt(),
      commentNum: (json['commentNum'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      reviewStatus: (json['reviewStatus'] as num?)?.toInt(),
      reviewMessage: json['reviewMessage'],
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
      hasThumb: json['hasThumb'] as bool?,
      hasFavour: json['hasFavour'] as bool?,
      status: json['status'],
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'plainTextDescription': instance.plainTextDescription,
      'category': instance.category,
      'viewNum': instance.viewNum,
      'viewCount': instance.viewCount,
      'thumbNum': instance.thumbNum,
      'favourNum': instance.favourNum,
      'commentNum': instance.commentNum,
      'priority': instance.priority,
      'userId': instance.userId,
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
      'hasThumb': instance.hasThumb,
      'hasFavour': instance.hasFavour,
      'status': instance.status,
    };
