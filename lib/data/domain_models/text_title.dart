import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_title.freezed.dart';

part 'text_title.g.dart';

@freezed
abstract class TextTitleDataModel with _$TextTitleDataModel {
  const factory TextTitleDataModel({
    required String title,
    @Default('') String description,
    @Default(0) int id,
    @Default(null) DateTime? dateAdded,
  }) = _TextTitleDataModel;

  factory TextTitleDataModel.fromJson(Map<String, Object?> json) =>
      _$TextTitleDataModelFromJson(json);
}
