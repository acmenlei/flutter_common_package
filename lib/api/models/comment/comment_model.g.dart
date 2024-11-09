// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentListModel _$CommentListModelFromJson(Map<String, dynamic> json) =>
    CommentListModel(
      code: (json['code'] as num).toInt(),
      data: json['data'] == null
          ? null
          : CommentVoPage.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$CommentListModelToJson(CommentListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

CommentVoPage _$CommentVoPageFromJson(Map<String, dynamic> json) =>
    CommentVoPage(
      records: (json['records'] as List<dynamic>)
          .map((e) => CommentVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as String?,
      size: json['size'] as String?,
      current: json['current'] as String?,
      orders: json['orders'] as List<dynamic>?,
      optimizeCountSql: json['optimizeCountSql'] as bool?,
      searchCount: json['searchCount'] as bool?,
      countId: json['countId'],
      maxLimit: json['maxLimit'],
      pages: json['pages'] as String?,
    );

Map<String, dynamic> _$CommentVoPageToJson(CommentVoPage instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'orders': instance.orders,
      'optimizeCountSql': instance.optimizeCountSql,
      'searchCount': instance.searchCount,
      'countId': instance.countId,
      'maxLimit': instance.maxLimit,
      'pages': instance.pages,
    };

CommentVo _$CommentVoFromJson(Map<String, dynamic> json) => CommentVo(
      id: json['id'] as String?,
      targetType: (json['targetType'] as num?)?.toInt(),
      targetId: json['targetId'] as String?,
      content: json['content'] as String?,
      plainTextDescription: json['plainTextDescription'],
      type: json['type'] as String?,
      contentType: (json['contentType'] as num?)?.toInt(),
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      reviewStatus: (json['reviewStatus'] as num?)?.toInt(),
      reviewMessage: json['reviewMessage'],
      reviewerId: json['reviewerId'],
      reviewTime: (json['reviewTime'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      planetUserId: json['planetUserId'],
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      postId: json['postId'],
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      hasThumb: json['hasThumb'] as bool?,
      replyVoPage: json['replyVOPage'] == null
          ? null
          : ReplyVoPage.fromJson(json['replyVOPage'] as Map<String, dynamic>),
      needVip: json['needVip'],
      postVo: json['postVO'] == null
          ? null
          : PostModel.fromJson(json['postVO'] as Map<String, dynamic>),
      atUserList: json['atUserList'] as List<dynamic>?,
      atUserVoList: json['atUserVOList'],
      pictureList: json['pictureList'] as List<dynamic>?,
      courseArticleVo: json['courseArticleVO'],
      qaVo: json['qaVO'] == null
          ? null
          : QaVoModel.fromJson(json['qaVO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentVoToJson(CommentVo instance) => <String, dynamic>{
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

ReplyVoPage _$ReplyVoPageFromJson(Map<String, dynamic> json) => ReplyVoPage(
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => ReplyVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as String?,
      size: json['size'] as String?,
      current: json['current'] as String?,
      orders: json['orders'] as List<dynamic>?,
      optimizeCountSql: json['optimizeCountSql'] as bool?,
      searchCount: json['searchCount'] as bool?,
      countId: json['countId'],
      maxLimit: json['maxLimit'],
      pages: json['pages'] as String?,
    );

Map<String, dynamic> _$ReplyVoPageToJson(ReplyVoPage instance) =>
    <String, dynamic>{
      'records': instance.records,
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'orders': instance.orders,
      'optimizeCountSql': instance.optimizeCountSql,
      'searchCount': instance.searchCount,
      'countId': instance.countId,
      'maxLimit': instance.maxLimit,
      'pages': instance.pages,
    };

ReplyVo _$ReplyVoFromJson(Map<String, dynamic> json) => ReplyVo(
      id: json['id'] as String?,
      postId: json['postId'],
      targetType: (json['targetType'] as num?)?.toInt(),
      targetId: json['targetId'] as String?,
      commentId: json['commentId'] as String?,
      content: json['content'] as String?,
      contentType: (json['contentType'] as num?)?.toInt(),
      replyId: json['replyId'] as String?,
      replyUserId: json['replyUserId'] as String?,
      replyPlanetUserId: json['replyPlanetUserId'],
      planetUserId: json['planetUserId'],
      thumbNum: (json['thumbNum'] as num?)?.toInt(),
      reviewStatus: (json['reviewStatus'] as num?)?.toInt(),
      reviewMessage: json['reviewMessage'],
      reviewerId: json['reviewerId'],
      reviewTime: (json['reviewTime'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      replyUser: json['replyUser'] == null
          ? null
          : UserModel.fromJson(json['replyUser'] as Map<String, dynamic>),
      hasThumb: json['hasThumb'] as bool?,
      atUserList: json['atUserList'] as List<dynamic>?,
      atUserVoList: json['atUserVOList'],
      pictureList: json['pictureList'] as List<dynamic>?,
    );

Map<String, dynamic> _$ReplyVoToJson(ReplyVo instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'targetType': instance.targetType,
      'targetId': instance.targetId,
      'commentId': instance.commentId,
      'content': instance.content,
      'contentType': instance.contentType,
      'replyId': instance.replyId,
      'replyUserId': instance.replyUserId,
      'replyPlanetUserId': instance.replyPlanetUserId,
      'planetUserId': instance.planetUserId,
      'thumbNum': instance.thumbNum,
      'reviewStatus': instance.reviewStatus,
      'reviewMessage': instance.reviewMessage,
      'reviewerId': instance.reviewerId,
      'reviewTime': instance.reviewTime,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'user': instance.user,
      'replyUser': instance.replyUser,
      'hasThumb': instance.hasThumb,
      'atUserList': instance.atUserList,
      'atUserVOList': instance.atUserVoList,
      'pictureList': instance.pictureList,
    };
