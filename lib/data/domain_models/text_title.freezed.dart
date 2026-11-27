// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextTitleDataModel {

 String get title; String get description; int get id; DateTime? get dateAdded;
/// Create a copy of TextTitleDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextTitleDataModelCopyWith<TextTitleDataModel> get copyWith => _$TextTitleDataModelCopyWithImpl<TextTitleDataModel>(this as TextTitleDataModel, _$identity);

  /// Serializes this TextTitleDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TextTitleDataModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextTitleDataModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.dateAdded, _this.dateAdded) || other.dateAdded == _this.dateAdded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TextTitleDataModel;
  return Object.hash(runtimeType,_this.title,_this.description,_this.id,_this.dateAdded);
}

@override
String toString() {
  final _this = this as TextTitleDataModel;
  return 'TextTitleDataModel(title: ${_this.title}, description: ${_this.description}, id: ${_this.id}, dateAdded: ${_this.dateAdded})';
}


}

/// @nodoc
abstract mixin class $TextTitleDataModelCopyWith<$Res>  {
  factory $TextTitleDataModelCopyWith(TextTitleDataModel value, $Res Function(TextTitleDataModel) _then) = _$TextTitleDataModelCopyWithImpl;
@useResult
$Res call({
 String title, String description, int id, DateTime? dateAdded
});




}
/// @nodoc
class _$TextTitleDataModelCopyWithImpl<$Res>
    implements $TextTitleDataModelCopyWith<$Res> {
  _$TextTitleDataModelCopyWithImpl(this._self, this._then);

  final TextTitleDataModel _self;
  final $Res Function(TextTitleDataModel) _then;

/// Create a copy of TextTitleDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? id = null,Object? dateAdded = freezed,}) {
  return _then(TextTitleDataModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TextTitleDataModel].
extension TextTitleDataModelPatterns on TextTitleDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextTitleDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextTitleDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextTitleDataModel value)  $default,){
final _that = this;
switch (_that) {
case _TextTitleDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextTitleDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextTitleDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  int id,  DateTime? dateAdded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextTitleDataModel() when $default != null:
return $default(_that.title,_that.description,_that.id,_that.dateAdded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  int id,  DateTime? dateAdded)  $default,) {final _that = this;
switch (_that) {
case _TextTitleDataModel():
return $default(_that.title,_that.description,_that.id,_that.dateAdded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  int id,  DateTime? dateAdded)?  $default,) {final _that = this;
switch (_that) {
case _TextTitleDataModel() when $default != null:
return $default(_that.title,_that.description,_that.id,_that.dateAdded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextTitleDataModel implements TextTitleDataModel {
  const _TextTitleDataModel({required this.title, this.description = '', this.id = 0, this.dateAdded = null});
  factory _TextTitleDataModel.fromJson(Map<String, dynamic> json) => _$TextTitleDataModelFromJson(json);

@override final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  int id;
@override@JsonKey() final  DateTime? dateAdded;

/// Create a copy of TextTitleDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextTitleDataModelCopyWith<_TextTitleDataModel> get copyWith => __$TextTitleDataModelCopyWithImpl<_TextTitleDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextTitleDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextTitleDataModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.id, id) || other.id == id)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,description,id,dateAdded);
}

@override
String toString() {
    return 'TextTitleDataModel(title: $title, description: $description, id: $id, dateAdded: $dateAdded)';
}


}

/// @nodoc
abstract mixin class _$TextTitleDataModelCopyWith<$Res> implements $TextTitleDataModelCopyWith<$Res> {
  factory _$TextTitleDataModelCopyWith(_TextTitleDataModel value, $Res Function(_TextTitleDataModel) _then) = __$TextTitleDataModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, int id, DateTime? dateAdded
});




}
/// @nodoc
class __$TextTitleDataModelCopyWithImpl<$Res>
    implements _$TextTitleDataModelCopyWith<$Res> {
  __$TextTitleDataModelCopyWithImpl(this._self, this._then);

  final _TextTitleDataModel _self;
  final $Res Function(_TextTitleDataModel) _then;

/// Create a copy of TextTitleDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? id = null,Object? dateAdded = freezed,}) {
  return _then(_TextTitleDataModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
