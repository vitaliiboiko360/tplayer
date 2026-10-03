import 'package:tplayer/data/domain_models/text_title.dart';
import 'package:tplayer/data/services/content_client.dart';
import 'package:tplayer/utils/result.dart';

abstract class ContentRepository {
  Future<Result<List<TextTitle>>> getListAllTextTitles();
}

class ContentRepositoryHttp implements ContentRepository {
  ContentRepositoryHttp({required ContentClient contentClient})
    : _contentClient = contentClient;

  final ContentClient _contentClient;

  List<TextTitle>? _cachedAllTextTitles;

  @override
  Future<Result<List<TextTitle>>> getListAllTextTitles() async {
    if (_cachedAllTextTitles == null) {
      final result = await _contentClient.getListAllTextTitles();
      if (result is Ok<List<TextTitle>>) {
        _cachedAllTextTitles = result.value;
      }
      return result;
    } else {
      return Result.ok(_cachedAllTextTitles!);
    }
  }
}
