// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_num_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseNumModel _$ResponseNumModelFromJson(Map<String, dynamic> json) =>
    ResponseNumModel(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseNumModelToJson(ResponseNumModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
