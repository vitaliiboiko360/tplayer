import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_line.freezed.dart';

// part 'text_line.g.dart';

@freezed
abstract class TextLine with _$TextLine {
  const factory TextLine({
    required String text,
    @Default(null) int? order,
    @Default(null) int? id,
    @Default(null) int? audioStart,
    @Default(null) int? audioEnd,
  }) = _TextLine;

  factory TextLine.fromJson(Map<String, Object?> json, int? index) {
    return TextLine(
      text: json['text'] as String,
      order: index,
      audioStart: json['start'] as int,
      audioEnd: json['end'] as int,
    );
  }
}
