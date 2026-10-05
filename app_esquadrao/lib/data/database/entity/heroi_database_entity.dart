import 'package:json_annotation/json_annotation.dart';

part 'heroi_database_entity.g.dart';

@JsonSerializable()
class HeroiDatabaseEntity {
  @JsonKey(name: HeroiDatabaseContract.localIdColumn)
  final int? localId;

  @JsonKey(name: HeroiDatabaseContract.idColumn)
  final String id;

  @JsonKey(name: HeroiDatabaseContract.nomeColumn)
  final String nome;

  @JsonKey(name: HeroiDatabaseContract.intelligenceColumn)
  final int intelligence;

  @JsonKey(name: HeroiDatabaseContract.strengthColumn)
  final int strength;

  @JsonKey(name: HeroiDatabaseContract.speedColumn)
  final int speed;

  @JsonKey(name: HeroiDatabaseContract.durabilityColumn)
  final int durability;

  @JsonKey(name: HeroiDatabaseContract.powerColumn)
  final int power;

  @JsonKey(name: HeroiDatabaseContract.combatColumn)
  final int combat;

  @JsonKey(name: HeroiDatabaseContract.alturaColumn)
  final String altura;

  @JsonKey(name: HeroiDatabaseContract.pesoColumn)
  final String peso;

  @JsonKey(name: HeroiDatabaseContract.imgUrlColumn)
  final String? imageUrl;

  HeroiDatabaseEntity({
    this.localId,
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

  factory HeroiDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      _$HeroiDatabaseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HeroiDatabaseEntityToJson(this);
}

abstract class HeroiDatabaseContract {
  static const String heroiTable = 'heroi_table';

  static const String localIdColumn = 'local_id';
  static const String idColumn = 'id';
  static const String nomeColumn = 'nome';

  static const String intelligenceColumn = 'intelligence';
  static const String strengthColumn = 'strength';
  static const String speedColumn = 'speed';
  static const String durabilityColumn = 'durability';
  static const String powerColumn = 'power';
  static const String combatColumn = 'combat';

  static const String alturaColumn = 'altura';
  static const String pesoColumn = 'peso';

  static const String imgUrlColumn = 'img_url';
}