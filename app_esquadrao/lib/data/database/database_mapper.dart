import '../../domain/exception/mapper_exception.dart';
import '../../domain/heroi.dart';
import 'entity/heroi_database_entity.dart';

class DatabaseMapper {
  Heroi toHeroi(HeroiDatabaseEntity entity) {
    try {
      return Heroi(
        id: entity.id,
        nome: entity.nome,
        poder: entity.poder,
        imageUrl: entity.imageUrl,
      );
    } catch (e) {
      throw MapperException<HeroiDatabaseEntity, Heroi>(e.toString());
    }
  }

  List<Heroi> toHerois(List<HeroiDatabaseEntity> entities) {
    final List<Heroi> herois = [];
    for (var entity in entities) {
      herois.add(toHeroi(entity));
    }
    return herois;
  }

  HeroiDatabaseEntity toHeroiDatabaseEntity(Heroi heroi) {
    try {
      return HeroiDatabaseEntity(
        localId: null, // Deixamos nulo para o banco de dados gerar o número sozinho
        id: heroi.id,
        nome: heroi.nome,
        poder: heroi.poder,
        imageUrl: heroi.imageUrl,
      );
    } catch (e) {
      throw MapperException<HeroiDatabaseEntity, Heroi>(e.toString());
    }
  }

  List<HeroiDatabaseEntity> toHeroiDatabaseEntities(List<Heroi> herois) {
    final List<HeroiDatabaseEntity> entities = [];
    for (var h in herois) {
      entities.add(toHeroiDatabaseEntity(h));
    }
    return entities;
  }
}