import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/data/domain_models/text_title.dart';
import 'package:tplayer/data/services/content_client.dart';
import 'package:tplayer/utils/result.dart';

abstract class ContentRepository {
  Future<Result<List<TextTitleDataModel>>> getListAllTextTitleDataModels();
  Future<Result<List<TextTitleDataModel>>> getListAllTextTitleDataModels2();
  Future<Result<List<TextLineDataModel>>> getListTextLines();
}

class ContentHttpRepository implements ContentRepository {
  ContentHttpRepository({required ContentClientService contentClient})
    : _contentClient = contentClient;

  final ContentClientService _contentClient;

  List<TextTitleDataModel>? _cachedAllTextTitleDataModels;

  @override
  Future<Result<List<TextTitleDataModel>>>
  getListAllTextTitleDataModels() async {
    if (_cachedAllTextTitleDataModels == null) {
      final result = await _contentClient.getListTextStories();
      if (result is Ok<List<TextTitleDataModel>>) {
        _cachedAllTextTitleDataModels = result.value;
      }
      return result;
    } else {
      return Result.ok(_cachedAllTextTitleDataModels!);
    }
  }

  @override
  Future<Result<List<TextTitleDataModel>>>
  getListAllTextTitleDataModels2() async {
    if (_cachedAllTextTitleDataModels == null) {
      final result = await _contentClient.getListAllTextTitles();
      if (result is Ok<List<TextTitleDataModel>>) {
        _cachedAllTextTitleDataModels = result.value;
      }
      return result;
    } else {
      return Result.ok(_cachedAllTextTitleDataModels!);
    }
  }

  @override
  Future<Result<List<TextLineDataModel>>> getListTextLines() async {
    print('content repostiry called');
    return await _contentClient.getListTextLines();
  }
}
