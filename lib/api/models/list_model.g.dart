// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModelList _$PostModelListFromJson(Map<String, dynamic> json) =>
    PostModelList(
      code: (json['code'] as num).toInt(),
      data: ResponseRecords.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$PostModelListToJson(PostModelList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

ResponseRecords _$ResponseRecordsFromJson(Map<String, dynamic> json) =>
    ResponseRecords(
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ResponseRecordsToJson(ResponseRecords instance) =>
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
