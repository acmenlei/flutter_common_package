// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qa_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QaModelList _$QaModelListFromJson(Map<String, dynamic> json) => QaModelList(
      code: (json['code'] as num).toInt(),
      data: ResponseQaRecords.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$QaModelListToJson(QaModelList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

ResponseQaRecords _$ResponseQaRecordsFromJson(Map<String, dynamic> json) =>
    ResponseQaRecords(
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => QaVoModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ResponseQaRecordsToJson(ResponseQaRecords instance) =>
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
