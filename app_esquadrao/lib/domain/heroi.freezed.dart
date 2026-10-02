// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heroi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Heroi implements DiagnosticableTreeMixin {

 String get id; String get nome; String get poder; String? get imageUrl;
/// Create a copy of Heroi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroiCopyWith<Heroi> get copyWith => _$HeroiCopyWithImpl<Heroi>(this as Heroi, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Heroi;
  properties
    ..add(DiagnosticsProperty('type', 'Heroi'))
    ..add(DiagnosticsProperty('id', _this.id))..add(DiagnosticsProperty('nome', _this.nome))..add(DiagnosticsProperty('poder', _this.poder))..add(DiagnosticsProperty('imageUrl', _this.imageUrl));
}

@override
bool operator ==(Object other) {
  final _this = this as Heroi;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Heroi&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.poder, _this.poder) || other.poder == _this.poder)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}


@override
int get hashCode {
  final _this = this as Heroi;
  return Object.hash(runtimeType,_this.id,_this.nome,_this.poder,_this.imageUrl);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Heroi;
  return 'Heroi(id: ${_this.id}, nome: ${_this.nome}, poder: ${_this.poder}, imageUrl: ${_this.imageUrl})';
}


}

/// @nodoc
abstract mixin class $HeroiCopyWith<$Res>  {
  factory $HeroiCopyWith(Heroi value, $Res Function(Heroi) _then) = _$HeroiCopyWithImpl;
@useResult
$Res call({
 String id, String nome, String poder, String? imageUrl
});




}
/// @nodoc
class _$HeroiCopyWithImpl<$Res>
    implements $HeroiCopyWith<$Res> {
  _$HeroiCopyWithImpl(this._self, this._then);

  final Heroi _self;
  final $Res Function(Heroi) _then;

/// Create a copy of Heroi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? poder = null,Object? imageUrl = freezed,}) {
  return _then(Heroi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,poder: null == poder ? _self.poder : poder // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Heroi].
extension HeroiPatterns on Heroi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Heroi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Heroi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Heroi value)  $default,){
final _that = this;
switch (_that) {
case _Heroi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Heroi value)?  $default,){
final _that = this;
switch (_that) {
case _Heroi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nome,  String poder,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Heroi() when $default != null:
return $default(_that.id,_that.nome,_that.poder,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nome,  String poder,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Heroi():
return $default(_that.id,_that.nome,_that.poder,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nome,  String poder,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Heroi() when $default != null:
return $default(_that.id,_that.nome,_that.poder,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Heroi with DiagnosticableTreeMixin implements Heroi {
  const _Heroi({required this.id, required this.nome, required this.poder, this.imageUrl});
  

@override final  String id;
@override final  String nome;
@override final  String poder;
@override final  String? imageUrl;

/// Create a copy of Heroi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroiCopyWith<_Heroi> get copyWith => __$HeroiCopyWithImpl<_Heroi>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Heroi'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nome', nome))..add(DiagnosticsProperty('poder', poder))..add(DiagnosticsProperty('imageUrl', imageUrl));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Heroi&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.poder, poder) || other.poder == poder)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,nome,poder,imageUrl);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Heroi(id: $id, nome: $nome, poder: $poder, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$HeroiCopyWith<$Res> implements $HeroiCopyWith<$Res> {
  factory _$HeroiCopyWith(_Heroi value, $Res Function(_Heroi) _then) = __$HeroiCopyWithImpl;
@override @useResult
$Res call({
 String id, String nome, String poder, String? imageUrl
});




}
/// @nodoc
class __$HeroiCopyWithImpl<$Res>
    implements _$HeroiCopyWith<$Res> {
  __$HeroiCopyWithImpl(this._self, this._then);

  final _Heroi _self;
  final $Res Function(_Heroi) _then;

/// Create a copy of Heroi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? poder = null,Object? imageUrl = freezed,}) {
  return _then(_Heroi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,poder: null == poder ? _self.poder : poder // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
