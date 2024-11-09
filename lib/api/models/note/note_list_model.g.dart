// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModelList _$NoteModelListFromJson(Map<String, dynamic> json) =>
    NoteModelList(
      code: (json['code'] as num).toInt(),
      data: ResponseNoteRecords.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$NoteModelListToJson(NoteModelList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

ResponseNoteRecords _$ResponseNoteRecordsFromJson(Map<String, dynamic> json) =>
    ResponseNoteRecords(
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ResponseNoteRecordsToJson(
        ResponseNoteRecords instance) =>
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
