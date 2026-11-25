import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:tplayer/audio/audio_cubit_state.dart';

class Audio extends StatefulWidget {
  Audio(this.uri);

  String uri;

  @override
  State<StatefulWidget> createState() => AudioState();
}

class AudioState extends State<Audio> with WidgetsBindingObserver {
  final _player = AudioPlayer();

  Future<void> _init() async {
    _player.errorStream.listen((e) {
      print(e);
    });

    try {
      await _player.setAudioSource(
        AudioSource.uri(Uri.parse(widget.uri)),
        initialIndex: 0,
        initialPosition: Duration.zero,
      );
    } on PlayerException catch (e) {
      print(e);
    } on IndexError catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  StreamSubscription<Duration>? _endTimePositionListener;

  int _getDecimalDigitsOrZero(double inputNumber) {
    List<String> numParts = inputNumber.toString().split('.');
    if (numParts.length < 2) return 0;
    return int.tryParse(numParts[1]) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final startTime = BlocProvider.of<AudioCubit>(context).state.startTime;
    final endTime = BlocProvider.of<AudioCubit>(context).state.endTime;

    _player.seek(
      Duration(
        seconds: startTime.truncate(),
        milliseconds: _getDecimalDigitsOrZero(startTime),
      ),
    );
    _endTimePositionListener?.cancel();
    _endTimePositionListener = _player.positionStream.listen((
      Duration currentPosition,
    ) {
      if (currentPosition >=
          Duration(
            seconds: endTime.truncate(),
            milliseconds: _getDecimalDigitsOrZero(endTime),
          )) {
        _player.pause();
      }
    });

    if (BlocProvider.of<AudioCubit>(context).state.isPlaying) {
      _player.play();
    } else {
      _player.pause();
    }

    return SizedBox.shrink();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }
}

class AudioCubit extends Cubit<AudioCubitState> {
  AudioCubit() : super(AudioCubitState(false, 0, 0));

  void play() => emit(state.copyWith(isPlaying: true));
  void pause() => emit(state.copyWith(isPlaying: false));
  void setStartTime(double startTime) =>
      emit(state.copyWith(startTime: startTime));
  void setEndTime(double endTime) => emit(state.copyWith(endTime: endTime));
  void setTime(double startTime, double endTime) =>
      emit(state.copyWith(startTime: startTime, endTime: endTime));
}
