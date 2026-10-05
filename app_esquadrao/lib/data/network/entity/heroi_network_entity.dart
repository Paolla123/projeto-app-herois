import 'package:json_annotation/json_annotation.dart';

part 'heroi_network_entity.g.dart';

@JsonSerializable(createToJson: false)
class HttpPagedResult {
  int first;
  dynamic prev;
  int? next;
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

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) =>
      _$HttpPagedResultFromJson(json);
}

@JsonSerializable(createFactory: false, createToJson: false)
class HeroiNetworkEntity {
  final String id;
  final String nome;

  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  final String altura;
  final String peso;

  final String? imageUrl;

  HeroiNetworkEntity({
    required this.id,
    required this.nome,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
    required this.altura,
    required this.peso,
    this.imageUrl,
  });

  factory HeroiNetworkEntity.fromJson(Map<String, dynamic> json) {
    final powerstats =
        json['powerstats'] as Map<String, dynamic>? ?? {};

    final appearance =
        json['appearance'] as Map<String, dynamic>? ?? {};

    final images =
        json['images'] as Map<String, dynamic>? ?? {};

    final height = appearance['height'];
    final weight = appearance['weight'];

    return HeroiNetworkEntity(
      id: json['id'].toString(),
      nome: json['name']?.toString() ?? 'Sem nome',

      intelligence: _toInt(powerstats['intelligence']),
      strength: _toInt(powerstats['strength']),
      speed: _toInt(powerstats['speed']),
      durability: _toInt(powerstats['durability']),
      power: _toInt(powerstats['power']),
      combat: _toInt(powerstats['combat']),

      altura: _formatAppearanceValue(height),
      peso: _formatAppearanceValue(weight),

      imageUrl: images['sm']?.toString(),
    );
  }

  static int _toInt(dynamic value) {
    if (value is int) {
      return value;
    }

    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static String _formatAppearanceValue(dynamic value) {
    if (value is List) {
      return value.map((item) => item.toString()).join(' / ');
    }

    return value?.toString() ?? 'Não informado';
  }
}