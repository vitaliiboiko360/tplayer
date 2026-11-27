import 'package:bloc/bloc.dart';
import 'package:tplayer/data/domain_models/text_title.dart';
import 'package:tplayer/data/repositories/content_repository.dart';
import 'package:tplayer/utils/result.dart';

sealed class TextPageLinesEvent {}

final class GetTextPageLines extends TextPageLinesEvent {}

class PageTextCatalogListTextsModel
    extends Bloc<TextPageLinesEvent, List<TextTitle>> {
  PageTextCatalogListTextsModel(this._contentRepository)
    : super(<TextTitle>[]) {
    on<GetTextPageLines>((event, emit) async {
      final Result<List<TextTitle>> result = await _contentRepository
          .getListAllTextTitles();
      switch (result) {
        case Ok():
          emit(result.value);
        case Error():
          print(result.error);
          emit(<TextTitle>[]);
      }
    });
  }

  final ContentRepository _contentRepository;
}
