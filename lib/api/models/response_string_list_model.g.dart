// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_string_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStringListModel _$ResponseStringListModelFromJson(
        Map<String, dynamic> json) =>
    ResponseStringListModel(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseStringListModelToJson(
        ResponseStringListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
