import 'package:bloc/bloc.dart';
import 'package:tplayer/data/domain_models/text_title.dart';
import 'package:tplayer/data/repositories/content_repository.dart';
import 'package:tplayer/utils/result.dart';

sealed class TextCatalogEvent {}

final class GetTextTitlesEvent extends TextCatalogEvent {}

class PageTextCatalogListTextsModel
    extends Bloc<GetTextTitlesEvent, List<TextTitleDataModel>> {
  PageTextCatalogListTextsModel(this._contentRepository)
    : super(<TextTitleDataModel>[]) {
    on<GetTextTitlesEvent>((event, emit) async {
      final Result<List<TextTitleDataModel>> result = await _contentRepository
          .getListAllTextTitleDataModels();
      switch (result) {
        case Ok():
          emit(result.value);
        case Error():
          print(result.error);
          emit(<TextTitleDataModel>[]);
      }
    });
  }

  final ContentRepository _contentRepository;
}
