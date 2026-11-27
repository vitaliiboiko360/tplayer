// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextTitleDataModel _$TextTitleDataModelFromJson(Map<String, dynamic> json) =>
    _TextTitleDataModel(
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      dateAdded: json['dateAdded'] == null
          ? null
          : DateTime.parse(json['dateAdded'] as String),
    );

Map<String, dynamic> _$TextTitleDataModelToJson(_TextTitleDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'dateAdded': instance.dateAdded?.toIso8601String(),
    };
