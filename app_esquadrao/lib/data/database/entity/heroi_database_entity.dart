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
  @JsonKey(name: HeroiDatabaseContract.poderColumn)
  final String poder;
  @JsonKey(name: HeroiDatabaseContract.imgUrl)
  final String? imageUrl;

  HeroiDatabaseEntity({
    this.localId,
    required this.id,
    required this.nome,
    required this.poder,
    this.imageUrl,
  });

  factory HeroiDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      _$HeroiDatabaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HeroiDatabaseEntityToJson(this);
}

abstract class HeroiDatabaseContract {
  static const String heroiTable = "heroi_table";
  static const String localIdColumn = "local_id";
  static const String idColumn = "id";
  static const String nomeColumn = "nome";
  static const String poderColumn = "poder";
  static const String imgUrl = "img_url";
}