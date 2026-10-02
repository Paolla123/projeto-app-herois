// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroi_network_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpPagedResult _$HttpPagedResultFromJson(Map<String, dynamic> json) =>
    HttpPagedResult(
      first: (json['first'] as num).toInt(),
      prev: json['prev'],
      next: (json['next'] as num).toInt(),
      last: (json['last'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      items: (json['items'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => HeroiNetworkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HttpPagedResultToJson(HttpPagedResult instance) =>
    <String, dynamic>{
      'first': instance.first,
      'prev': instance.prev,
      'next': instance.next,
      'last': instance.last,
      'pages': instance.pages,
      'items': instance.items,
      'data': instance.data,
    };

HeroiNetworkEntity _$HeroiNetworkEntityFromJson(Map<String, dynamic> json) =>
    HeroiNetworkEntity(
      id: json['id'] as String,
      nome: json['nome'] as String,
      poder: json['poder'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$HeroiNetworkEntityToJson(HeroiNetworkEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'poder': instance.poder,
      'imageUrl': instance.imageUrl,
    };
