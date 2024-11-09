// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_vo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentVoModel _$CommentVoModelFromJson(Map<String, dynamic> json) =>
    CommentVoModel(
      code: (json['code'] as num).toInt(),
      data: CommentVo.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$CommentVoModelToJson(CommentVoModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
