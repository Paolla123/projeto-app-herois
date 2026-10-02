import 'package:json_annotation/json_annotation.dart';

part 'heroi_network_entity.g.dart';

@JsonSerializable()
class HttpPagedResult {
  int first;
  dynamic prev;
  int next;
  int last;
  int pages;
  int items;
  List<HeroiNetworkEntity> data;

  HttpPagedResult({
    required this.first,
    required this.prev,
    required this.next,
    required this.last,
    required this.pages,
    required this.items,
    required this.data,
  });

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) => _$HttpPagedResultFromJson(json);
}

@JsonSerializable()
class HeroiNetworkEntity {
  String id;
  String nome;
  String poder;
  String? imageUrl;

  HeroiNetworkEntity({
    required this.id,
    required this.nome,
    required this.poder,
    this.imageUrl,
  });

  factory HeroiNetworkEntity.fromJson(Map<String, dynamic> json) => _$HeroiNetworkEntityFromJson(json);
}