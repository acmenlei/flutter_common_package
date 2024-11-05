// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_string_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStringModel _$ResponseStringModelFromJson(Map<String, dynamic> json) =>
    ResponseStringModel(
      code: (json['code'] as num).toInt(),
      data: json['data'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseStringModelToJson(
        ResponseStringModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
