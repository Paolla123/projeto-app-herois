import '../../domain/exception/mapper_exception.dart';
import '../../domain/heroi.dart';
import 'entity/heroi_database_entity.dart';

class DatabaseMapper {
  Heroi toHeroi(HeroiDatabaseEntity entity) {
    try {
      return Heroi(
        id: entity.id,
        nome: entity.nome,

        intelligence: entity.intelligence,
        strength: entity.strength,
        speed: entity.speed,
        durability: entity.durability,
        power: entity.power,
        combat: entity.combat,

        altura: entity.altura,
        peso: entity.peso,

        imageUrl: entity.imageUrl,
      );
    } catch (e) {
      throw MapperException<HeroiDatabaseEntity, Heroi>(
        e.toString(),
      );
    }
  }

  List<Heroi> toHerois(
    List<HeroiDatabaseEntity> entities,
  ) {
    final List<Heroi> herois = [];

    for (final entity in entities) {
      herois.add(toHeroi(entity));
    }

    return herois;
  }

  HeroiDatabaseEntity toHeroiDatabaseEntity(Heroi heroi) {
    try {
      return HeroiDatabaseEntity(
        localId: null,

        id: heroi.id,
        nome: heroi.nome,

        intelligence: heroi.intelligence,
        strength: heroi.strength,
        speed: heroi.speed,
        durability: heroi.durability,
        power: heroi.power,
        combat: heroi.combat,

        altura: heroi.altura,
        peso: heroi.peso,

        imageUrl: heroi.imageUrl,
      );
    } catch (e) {
      throw MapperException<HeroiDatabaseEntity, Heroi>(
        e.toString(),
      );
    }
  }

  List<HeroiDatabaseEntity> toHeroiDatabaseEntities(
    List<Heroi> herois,
  ) {
    final List<HeroiDatabaseEntity> entities = [];

    for (final heroi in herois) {
      entities.add(
        toHeroiDatabaseEntity(heroi),
      );
    }

    return entities;
  }
}