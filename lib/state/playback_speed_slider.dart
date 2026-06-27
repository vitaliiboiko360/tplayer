import 'package:bloc/bloc.dart';

class PlaybackSpeedSliderState {
  final bool isOpened;

  const PlaybackSpeedSliderState(this.isOpened);

  PlaybackSpeedSliderState copyWith({bool? isOpened}) {
    return PlaybackSpeedSliderState(isOpened ?? this.isOpened);
  }
}

class PlaybackSpeedSliderCubit extends Cubit<PlaybackSpeedSliderState> {
  PlaybackSpeedSliderCubit() : super(PlaybackSpeedSliderState(false));

  void toggle() {
    emit(state.copyWith(isOpened: !state.isOpened));
  }

  void setOpen() {
    emit(PlaybackSpeedSliderState(true));
  }

  void setClose() {
    emit(PlaybackSpeedSliderState(false));
  }
}
