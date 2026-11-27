import 'package:bloc/bloc.dart';

class SettingsMenuState {
  final bool isOpened;

  const SettingsMenuState(this.isOpened);

  SettingsMenuState copyWith({bool? isOpened}) {
    return SettingsMenuState(isOpened ?? this.isOpened);
  }
}

class SettingsMenuCubit extends Cubit<SettingsMenuState> {
  SettingsMenuCubit() : super(SettingsMenuState(false));

  void toggle() {
    emit(state.copyWith(isOpened: !state.isOpened));
  }

  void setClosed() {
    emit(state.copyWith(isOpened: false));
  }

  void setOpened() {
    emit(state.copyWith(isOpened: true));
  }
}
