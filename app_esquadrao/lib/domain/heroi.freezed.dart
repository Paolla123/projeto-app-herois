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
mixin _$Heroi {

 String get id; String get nome; int get intelligence; int get strength; int get speed; int get durability; int get power; int get combat; String get altura; String get peso; String? get imageUrl;
/// Create a copy of Heroi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroiCopyWith<Heroi> get copyWith => _$HeroiCopyWithImpl<Heroi>(this as Heroi, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Heroi;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Heroi&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.intelligence, _this.intelligence) || other.intelligence == _this.intelligence)&&(identical(other.strength, _this.strength) || other.strength == _this.strength)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.durability, _this.durability) || other.durability == _this.durability)&&(identical(other.power, _this.power) || other.power == _this.power)&&(identical(other.combat, _this.combat) || other.combat == _this.combat)&&(identical(other.altura, _this.altura) || other.altura == _this.altura)&&(identical(other.peso, _this.peso) || other.peso == _this.peso)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}


@override
int get hashCode {
  final _this = this as Heroi;
  return Object.hash(runtimeType,_this.id,_this.nome,_this.intelligence,_this.strength,_this.speed,_this.durability,_this.power,_this.combat,_this.altura,_this.peso,_this.imageUrl);
}

@override
String toString() {
  final _this = this as Heroi;
  return 'Heroi(id: ${_this.id}, nome: ${_this.nome}, intelligence: ${_this.intelligence}, strength: ${_this.strength}, speed: ${_this.speed}, durability: ${_this.durability}, power: ${_this.power}, combat: ${_this.combat}, altura: ${_this.altura}, peso: ${_this.peso}, imageUrl: ${_this.imageUrl})';
}


}

/// @nodoc
abstract mixin class $HeroiCopyWith<$Res>  {
  factory $HeroiCopyWith(Heroi value, $Res Function(Heroi) _then) = _$HeroiCopyWithImpl;
@useResult
$Res call({
 String id, String nome, int intelligence, int strength, int speed, int durability, int power, int combat, String altura, String peso, String? imageUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? intelligence = null,Object? strength = null,Object? speed = null,Object? durability = null,Object? power = null,Object? combat = null,Object? altura = null,Object? peso = null,Object? imageUrl = freezed,}) {
  return _then(Heroi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,intelligence: null == intelligence ? _self.intelligence : intelligence // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int,durability: null == durability ? _self.durability : durability // ignore: cast_nullable_to_non_nullable
as int,power: null == power ? _self.power : power // ignore: cast_nullable_to_non_nullable
as int,combat: null == combat ? _self.combat : combat // ignore: cast_nullable_to_non_nullable
as int,altura: null == altura ? _self.altura : altura // ignore: cast_nullable_to_non_nullable
as String,peso: null == peso ? _self.peso : peso // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nome,  int intelligence,  int strength,  int speed,  int durability,  int power,  int combat,  String altura,  String peso,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Heroi() when $default != null:
return $default(_that.id,_that.nome,_that.intelligence,_that.strength,_that.speed,_that.durability,_that.power,_that.combat,_that.altura,_that.peso,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nome,  int intelligence,  int strength,  int speed,  int durability,  int power,  int combat,  String altura,  String peso,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Heroi():
return $default(_that.id,_that.nome,_that.intelligence,_that.strength,_that.speed,_that.durability,_that.power,_that.combat,_that.altura,_that.peso,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nome,  int intelligence,  int strength,  int speed,  int durability,  int power,  int combat,  String altura,  String peso,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Heroi() when $default != null:
return $default(_that.id,_that.nome,_that.intelligence,_that.strength,_that.speed,_that.durability,_that.power,_that.combat,_that.altura,_that.peso,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Heroi implements Heroi {
  const _Heroi({required this.id, required this.nome, required this.intelligence, required this.strength, required this.speed, required this.durability, required this.power, required this.combat, required this.altura, required this.peso, this.imageUrl});
  

@override final  String id;
@override final  String nome;
@override final  int intelligence;
@override final  int strength;
@override final  int speed;
@override final  int durability;
@override final  int power;
@override final  int combat;
@override final  String altura;
@override final  String peso;
@override final  String? imageUrl;

/// Create a copy of Heroi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroiCopyWith<_Heroi> get copyWith => __$HeroiCopyWithImpl<_Heroi>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Heroi&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.intelligence, intelligence) || other.intelligence == intelligence)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.durability, durability) || other.durability == durability)&&(identical(other.power, power) || other.power == power)&&(identical(other.combat, combat) || other.combat == combat)&&(identical(other.altura, altura) || other.altura == altura)&&(identical(other.peso, peso) || other.peso == peso)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,nome,intelligence,strength,speed,durability,power,combat,altura,peso,imageUrl);
}

@override
String toString() {
    return 'Heroi(id: $id, nome: $nome, intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat, altura: $altura, peso: $peso, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$HeroiCopyWith<$Res> implements $HeroiCopyWith<$Res> {
  factory _$HeroiCopyWith(_Heroi value, $Res Function(_Heroi) _then) = __$HeroiCopyWithImpl;
@override @useResult
$Res call({
 String id, String nome, int intelligence, int strength, int speed, int durability, int power, int combat, String altura, String peso, String? imageUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? intelligence = null,Object? strength = null,Object? speed = null,Object? durability = null,Object? power = null,Object? combat = null,Object? altura = null,Object? peso = null,Object? imageUrl = freezed,}) {
  return _then(_Heroi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,intelligence: null == intelligence ? _self.intelligence : intelligence // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int,durability: null == durability ? _self.durability : durability // ignore: cast_nullable_to_non_nullable
as int,power: null == power ? _self.power : power // ignore: cast_nullable_to_non_nullable
as int,combat: null == combat ? _self.combat : combat // ignore: cast_nullable_to_non_nullable
as int,altura: null == altura ? _self.altura : altura // ignore: cast_nullable_to_non_nullable
as String,peso: null == peso ? _self.peso : peso // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
