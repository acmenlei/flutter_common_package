// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_bool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBoolModel _$ResponseBoolModelFromJson(Map<String, dynamic> json) =>
    ResponseBoolModel(
      code: (json['code'] as num).toInt(),
      data: json['data'] as bool?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseBoolModelToJson(ResponseBoolModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
