// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVoModelRecord _$UserVoModelRecordFromJson(Map<String, dynamic> json) =>
    UserVoModelRecord(
      code: (json['code'] as num).toInt(),
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserVoModelRecordToJson(UserVoModelRecord instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
