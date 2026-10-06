import '../../domain/heroi.dart';

abstract class ContratoDiarioRepository {
  Future<Heroi> getHeroiDoDia();
}