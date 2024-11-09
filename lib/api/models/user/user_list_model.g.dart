// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelList _$UserModelListFromJson(Map<String, dynamic> json) =>
    UserModelList(
      code: (json['code'] as num).toInt(),
      data: ResponseUserRecords.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserModelListToJson(UserModelList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

ResponseUserRecords _$ResponseUserRecordsFromJson(Map<String, dynamic> json) =>
    ResponseUserRecords(
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ResponseUserRecordsToJson(
        ResponseUserRecords instance) =>
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
