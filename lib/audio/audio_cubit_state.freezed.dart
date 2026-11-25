// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioCubitState {


/// Create a copy of AudioCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioCubitStateCopyWith<AudioCubitState> get copyWith => _$AudioCubitStateCopyWithImpl<AudioCubitState>(this as AudioCubitState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AudioCubitState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioCubitState&&(identical(other.isPlaying, _this.isPlaying) || other.isPlaying == _this.isPlaying)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime));
}


@override
int get hashCode {
  final _this = this as AudioCubitState;
  return Object.hash(runtimeType,_this.isPlaying,_this.startTime,_this.endTime);
}

@override
String toString() {
  final _this = this as AudioCubitState;
  return 'AudioCubitState(isPlaying: ${_this.isPlaying}, startTime: ${_this.startTime}, endTime: ${_this.endTime})';
}


}

/// @nodoc
abstract mixin class $AudioCubitStateCopyWith<$Res>  {
  factory $AudioCubitStateCopyWith(AudioCubitState value, $Res Function(AudioCubitState) _then) = _$AudioCubitStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, double startTime, double endTime
});




}
/// @nodoc
class _$AudioCubitStateCopyWithImpl<$Res>
    implements $AudioCubitStateCopyWith<$Res> {
  _$AudioCubitStateCopyWithImpl(this._self, this._then);

  final AudioCubitState _self;
  final $Res Function(AudioCubitState) _then;

/// Create a copy of AudioCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(AudioCubitState(
null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as double,null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}



// dart format on
