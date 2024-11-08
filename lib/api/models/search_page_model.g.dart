// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPageList _$SearchPageListFromJson(Map<String, dynamic> json) =>
    SearchPageList(
      code: (json['code'] as num).toInt(),
      data: SearchPage.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SearchPageListToJson(SearchPageList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

SearchPage _$SearchPageFromJson(Map<String, dynamic> json) => SearchPage(
      searchPage: ResponseQaRecords.fromJson(
          json['searchPage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchPageToJson(SearchPage instance) =>
    <String, dynamic>{
      'searchPage': instance.searchPage,
    };

ResponseQaRecords _$ResponseQaRecordsFromJson(Map<String, dynamic> json) =>
    ResponseQaRecords(
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
