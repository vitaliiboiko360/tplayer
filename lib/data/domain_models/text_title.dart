import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_title.freezed.dart';

part 'text_title.g.dart';

@freezed
abstract class TextTitle with _$TextTitle {
  const factory TextTitle({
    required String title,
    required String description,
    required int id,
    required DateTime dateAdded,
  }) = _TextTitle;

  factory TextTitle.fromJson(Map<String, Object?> json) =>
      _$TextTitleFromJson(json);
}
