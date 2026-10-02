// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextTitle _$TextTitleFromJson(Map<String, dynamic> json) => _TextTitle(
  title: json['title'] as String,
  description: json['description'] as String,
  id: (json['id'] as num).toInt(),
  dateAdded: DateTime.parse(json['dateAdded'] as String),
);

Map<String, dynamic> _$TextTitleToJson(_TextTitle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'dateAdded': instance.dateAdded.toIso8601String(),
    };
