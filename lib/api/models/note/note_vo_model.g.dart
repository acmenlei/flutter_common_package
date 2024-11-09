// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_vo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteVoModel _$NoteVoModelFromJson(Map<String, dynamic> json) => NoteVoModel(
      code: (json['code'] as num).toInt(),
      data: NoteModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$NoteVoModelToJson(NoteVoModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
