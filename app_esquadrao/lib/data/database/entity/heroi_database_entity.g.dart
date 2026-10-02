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
      poder: json['poder'] as String,
      imageUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$HeroiDatabaseEntityToJson(
  HeroiDatabaseEntity instance,
) => <String, dynamic>{
  'local_id': instance.localId,
  'id': instance.id,
  'nome': instance.nome,
  'poder': instance.poder,
  'img_url': instance.imageUrl,
};
