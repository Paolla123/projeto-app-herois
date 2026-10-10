import '../../domain/heroi.dart';
import '../database/dao/squad_dao.dart';
import '../database/entity/squad_database_entity.dart';
import 'heroi_repository.dart';
import 'squad_repository.dart';

class SquadRepositoryImpl
    implements SquadRepository {
  final SquadDao squadDao;
  final HeroiRepository heroiRepository;

  SquadRepositoryImpl({
    required this.squadDao,
    required this.heroiRepository,
  });

  @override
  Future<RecruitResult> recruit(
    Heroi heroi,
  ) async {
    final alreadyRecruited =
        await squadDao.containsHero(
      heroi.id,
    );

    if (alreadyRecruited) {
      return RecruitResult.alreadyRecruited;
    }

    final total =
        await squadDao.count();

    if (total >= 15) {
      return RecruitResult.squadFull;
    }

    await squadDao.insert(
      SquadDatabaseEntity(
        heroiId: heroi.id,
      ),
    );

    return RecruitResult.success;
  }

  @override
  Future<List<Heroi>> getSquad() async {
    final entities =
        await squadDao.selectAll();

    final List<Heroi> herois = [];

    for (final entity in entities) {
      final heroi =
          await heroiRepository.getHeroiById(
        entity.heroiId,
      );

      if (heroi != null) {
        herois.add(heroi);
      }
    }

    return herois;
  }

  @override
  Future<void> remove(
    String heroiId,
  ) async {
    await squadDao.deleteByHeroId(
      heroiId,
    );
  }

  @override
  Future<int> count() {
    return squadDao.count();
  }
}