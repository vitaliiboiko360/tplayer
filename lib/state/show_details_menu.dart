import 'package:bloc/bloc.dart';

class ShowDetailsMenuState {
  final bool isOpened;

  const ShowDetailsMenuState(this.isOpened);

  ShowDetailsMenuState copyWith({bool? isOpened}) {
    return ShowDetailsMenuState(isOpened ?? this.isOpened);
  }
}

class ShowDetailsMenuCubit extends Cubit<ShowDetailsMenuState> {
  ShowDetailsMenuCubit() : super(ShowDetailsMenuState(false));

  void toggleOpen() {
    emit(state.copyWith(isOpened: !state.isOpened));
  }
}
