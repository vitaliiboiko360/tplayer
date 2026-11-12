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
mixin _$TextLineDataModel {

 String get text; int? get order; int? get id; int? get audioStart; int? get audioEnd;
/// Create a copy of TextLineDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextLineDataModelCopyWith<TextLineDataModel> get copyWith => _$TextLineDataModelCopyWithImpl<TextLineDataModel>(this as TextLineDataModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TextLineDataModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextLineDataModel&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.audioStart, _this.audioStart) || other.audioStart == _this.audioStart)&&(identical(other.audioEnd, _this.audioEnd) || other.audioEnd == _this.audioEnd));
}


@override
int get hashCode {
  final _this = this as TextLineDataModel;
  return Object.hash(runtimeType,_this.text,_this.order,_this.id,_this.audioStart,_this.audioEnd);
}

@override
String toString() {
  final _this = this as TextLineDataModel;
  return 'TextLineDataModel(text: ${_this.text}, order: ${_this.order}, id: ${_this.id}, audioStart: ${_this.audioStart}, audioEnd: ${_this.audioEnd})';
}


}

/// @nodoc
abstract mixin class $TextLineDataModelCopyWith<$Res>  {
  factory $TextLineDataModelCopyWith(TextLineDataModel value, $Res Function(TextLineDataModel) _then) = _$TextLineDataModelCopyWithImpl;
@useResult
$Res call({
 String text, int? order, int? id, int? audioStart, int? audioEnd
});




}
/// @nodoc
class _$TextLineDataModelCopyWithImpl<$Res>
    implements $TextLineDataModelCopyWith<$Res> {
  _$TextLineDataModelCopyWithImpl(this._self, this._then);

  final TextLineDataModel _self;
  final $Res Function(TextLineDataModel) _then;

/// Create a copy of TextLineDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? order = freezed,Object? id = freezed,Object? audioStart = freezed,Object? audioEnd = freezed,}) {
  return _then(TextLineDataModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,audioStart: freezed == audioStart ? _self.audioStart : audioStart // ignore: cast_nullable_to_non_nullable
as int?,audioEnd: freezed == audioEnd ? _self.audioEnd : audioEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TextLineDataModel].
extension TextLineDataModelPatterns on TextLineDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextLineDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextLineDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextLineDataModel value)  $default,){
final _that = this;
switch (_that) {
case _TextLineDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextLineDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextLineDataModel() when $default != null:
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
case _TextLineDataModel() when $default != null:
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
case _TextLineDataModel():
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
case _TextLineDataModel() when $default != null:
return $default(_that.text,_that.order,_that.id,_that.audioStart,_that.audioEnd);case _:
  return null;

}
}

}

/// @nodoc


class _TextLineDataModel implements TextLineDataModel {
  const _TextLineDataModel({required this.text, this.order = null, this.id = null, this.audioStart = null, this.audioEnd = null});
  

@override final  String text;
@override@JsonKey() final  int? order;
@override@JsonKey() final  int? id;
@override@JsonKey() final  int? audioStart;
@override@JsonKey() final  int? audioEnd;

/// Create a copy of TextLineDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextLineDataModelCopyWith<_TextLineDataModel> get copyWith => __$TextLineDataModelCopyWithImpl<_TextLineDataModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextLineDataModel&&(identical(other.text, text) || other.text == text)&&(identical(other.order, order) || other.order == order)&&(identical(other.id, id) || other.id == id)&&(identical(other.audioStart, audioStart) || other.audioStart == audioStart)&&(identical(other.audioEnd, audioEnd) || other.audioEnd == audioEnd));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text,order,id,audioStart,audioEnd);
}

@override
String toString() {
    return 'TextLineDataModel(text: $text, order: $order, id: $id, audioStart: $audioStart, audioEnd: $audioEnd)';
}


}

/// @nodoc
abstract mixin class _$TextLineDataModelCopyWith<$Res> implements $TextLineDataModelCopyWith<$Res> {
  factory _$TextLineDataModelCopyWith(_TextLineDataModel value, $Res Function(_TextLineDataModel) _then) = __$TextLineDataModelCopyWithImpl;
@override @useResult
$Res call({
 String text, int? order, int? id, int? audioStart, int? audioEnd
});




}
/// @nodoc
class __$TextLineDataModelCopyWithImpl<$Res>
    implements _$TextLineDataModelCopyWith<$Res> {
  __$TextLineDataModelCopyWithImpl(this._self, this._then);

  final _TextLineDataModel _self;
  final $Res Function(_TextLineDataModel) _then;

/// Create a copy of TextLineDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? order = freezed,Object? id = freezed,Object? audioStart = freezed,Object? audioEnd = freezed,}) {
  return _then(_TextLineDataModel(
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
