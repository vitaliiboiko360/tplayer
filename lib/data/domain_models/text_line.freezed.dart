// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TextLine {

 String get text; int? get order; int? get id; int? get audioStart; int? get audioEnd;
/// Create a copy of TextLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextLineCopyWith<TextLine> get copyWith => _$TextLineCopyWithImpl<TextLine>(this as TextLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TextLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextLine&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.audioStart, _this.audioStart) || other.audioStart == _this.audioStart)&&(identical(other.audioEnd, _this.audioEnd) || other.audioEnd == _this.audioEnd));
}


@override
int get hashCode {
  final _this = this as TextLine;
  return Object.hash(runtimeType,_this.text,_this.order,_this.id,_this.audioStart,_this.audioEnd);
}

@override
String toString() {
  final _this = this as TextLine;
  return 'TextLine(text: ${_this.text}, order: ${_this.order}, id: ${_this.id}, audioStart: ${_this.audioStart}, audioEnd: ${_this.audioEnd})';
}


}

/// @nodoc
abstract mixin class $TextLineCopyWith<$Res>  {
  factory $TextLineCopyWith(TextLine value, $Res Function(TextLine) _then) = _$TextLineCopyWithImpl;
@useResult
$Res call({
 String text, int? order, int? id, int? audioStart, int? audioEnd
});




}
/// @nodoc
class _$TextLineCopyWithImpl<$Res>
    implements $TextLineCopyWith<$Res> {
  _$TextLineCopyWithImpl(this._self, this._then);

  final TextLine _self;
  final $Res Function(TextLine) _then;

/// Create a copy of TextLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? order = freezed,Object? id = freezed,Object? audioStart = freezed,Object? audioEnd = freezed,}) {
  return _then(TextLine(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,audioStart: freezed == audioStart ? _self.audioStart : audioStart // ignore: cast_nullable_to_non_nullable
as int?,audioEnd: freezed == audioEnd ? _self.audioEnd : audioEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TextLine].
extension TextLinePatterns on TextLine {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextLine() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextLine value)  $default,){
final _that = this;
switch (_that) {
case _TextLine():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextLine value)?  $default,){
final _that = this;
switch (_that) {
case _TextLine() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  int? order,  int? id,  int? audioStart,  int? audioEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextLine() when $default != null:
return $default(_that.text,_that.order,_that.id,_that.audioStart,_that.audioEnd);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  int? order,  int? id,  int? audioStart,  int? audioEnd)  $default,) {final _that = this;
switch (_that) {
case _TextLine():
return $default(_that.text,_that.order,_that.id,_that.audioStart,_that.audioEnd);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  int? order,  int? id,  int? audioStart,  int? audioEnd)?  $default,) {final _that = this;
switch (_that) {
case _TextLine() when $default != null:
return $default(_that.text,_that.order,_that.id,_that.audioStart,_that.audioEnd);case _:
  return null;

}
}

}

/// @nodoc


class _TextLine implements TextLine {
  const _TextLine({required this.text, this.order = null, this.id = null, this.audioStart = null, this.audioEnd = null});
  

@override final  String text;
@override@JsonKey() final  int? order;
@override@JsonKey() final  int? id;
@override@JsonKey() final  int? audioStart;
@override@JsonKey() final  int? audioEnd;

/// Create a copy of TextLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextLineCopyWith<_TextLine> get copyWith => __$TextLineCopyWithImpl<_TextLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextLine&&(identical(other.text, text) || other.text == text)&&(identical(other.order, order) || other.order == order)&&(identical(other.id, id) || other.id == id)&&(identical(other.audioStart, audioStart) || other.audioStart == audioStart)&&(identical(other.audioEnd, audioEnd) || other.audioEnd == audioEnd));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text,order,id,audioStart,audioEnd);
}

@override
String toString() {
    return 'TextLine(text: $text, order: $order, id: $id, audioStart: $audioStart, audioEnd: $audioEnd)';
}


}

/// @nodoc
abstract mixin class _$TextLineCopyWith<$Res> implements $TextLineCopyWith<$Res> {
  factory _$TextLineCopyWith(_TextLine value, $Res Function(_TextLine) _then) = __$TextLineCopyWithImpl;
@override @useResult
$Res call({
 String text, int? order, int? id, int? audioStart, int? audioEnd
});




}
/// @nodoc
class __$TextLineCopyWithImpl<$Res>
    implements _$TextLineCopyWith<$Res> {
  __$TextLineCopyWithImpl(this._self, this._then);

  final _TextLine _self;
  final $Res Function(_TextLine) _then;

/// Create a copy of TextLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? order = freezed,Object? id = freezed,Object? audioStart = freezed,Object? audioEnd = freezed,}) {
  return _then(_TextLine(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,audioStart: freezed == audioStart ? _self.audioStart : audioStart // ignore: cast_nullable_to_non_nullable
as int?,audioEnd: freezed == audioEnd ? _self.audioEnd : audioEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
