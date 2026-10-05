import '../../domain/exception/mapper_exception.dart';
import '../../domain/heroi.dart';
import 'entity/heroi_network_entity.dart';

class NetworkMapper {
  Heroi toHeroi(HeroiNetworkEntity entity) {
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
      throw MapperException<HeroiNetworkEntity, Heroi>(
        e.toString(),
      );
    }
  }

  List<Heroi> toHerois(List<HeroiNetworkEntity> entities) {
    final List<Heroi> herois = [];

    for (final entity in entities) {
      herois.add(toHeroi(entity));
    }

    return herois;
  }
}