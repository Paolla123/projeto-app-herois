// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroi_database_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroiDatabaseEntity _$HeroiDatabaseEntityFromJson(Map<String, dynamic> json) =>
    HeroiDatabaseEntity(
      localId: (json['local_id'] as num?)?.toInt(),
      id: json['id'] as String,
      nome: json['nome'] as String,
      intelligence: (json['intelligence'] as num).toInt(),
      strength: (json['strength'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
      durability: (json['durability'] as num).toInt(),
      power: (json['power'] as num).toInt(),
      combat: (json['combat'] as num).toInt(),
      altura: json['altura'] as String,
      peso: json['peso'] as String,
      imageUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$HeroiDatabaseEntityToJson(
  HeroiDatabaseEntity instance,
) => <String, dynamic>{
  'local_id': instance.localId,
  'id': instance.id,
  'nome': instance.nome,
  'intelligence': instance.intelligence,
  'strength': instance.strength,
  'speed': instance.speed,
  'durability': instance.durability,
  'power': instance.power,
  'combat': instance.combat,
  'altura': instance.altura,
  'peso': instance.peso,
  'img_url': instance.imageUrl,
};
