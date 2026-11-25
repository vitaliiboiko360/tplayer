import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_cubit_state.freezed.dart';

@freezed
class AudioCubitState(
  final bool isPlaying,
  final double startTime,
  final double endTime,
) with _$AudioCubitState;
