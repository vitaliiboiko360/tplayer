import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_line.freezed.dart';

// part 'text_line.g.dart';

@freezed
abstract class TextLineDataModel with _$TextLineDataModel {
  const factory TextLineDataModel({
    required String text,
    @Default(null) int? order,
    @Default(null) int? id,
    @Default(null) int? audioStart,
    @Default(null) int? audioEnd,
  }) = _TextLineDataModel;

  factory TextLineDataModel.fromJson(Map<String, Object?> json, int? index) {
    return TextLineDataModel(
      text: json['text'] as String,
      order: index,
      audioStart: json['start'] as int,
      audioEnd: json['end'] as int,
    );
  }
}
