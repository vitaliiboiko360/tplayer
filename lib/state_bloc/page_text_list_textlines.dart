import 'package:bloc/bloc.dart';
import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/data/repositories/content_repository.dart';
import 'package:tplayer/utils/result.dart';

sealed class TextPageLinesEvent {}

final class GetTextPageLines extends TextPageLinesEvent {}

class TextPageLinesViewModel
    extends Bloc<TextPageLinesEvent, List<TextLineDataModel>> {
  TextPageLinesViewModel.PageTextLinesViewModel(this._contentRepository)
    : super(<TextLineDataModel>[]) {
    on<GetTextPageLines>((event, emit) async {
      final Result<List<TextLineDataModel>> result = await _contentRepository
          .getListTextLines();
      switch (result) {
        case Ok():
          emit(result.value);
        case Error():
          print(result.error);
          emit(<TextLineDataModel>[]);
      }
    });
  }

  final ContentRepository _contentRepository;
}
