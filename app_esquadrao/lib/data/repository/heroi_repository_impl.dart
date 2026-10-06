import '../../domain/heroi.dart';
import '../database/dao/heroi_dao.dart';
import '../database/database_mapper.dart';
import '../network/client/api_client.dart';
import '../network/network_mapper.dart';
import 'heroi_repository.dart';

class HeroiRepositoryImpl
    implements HeroiRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final HeroiDao heroiDao;
  final DatabaseMapper databaseMapper;

  HeroiRepositoryImpl({
    required this.heroiDao,
    required this.databaseMapper,
    required this.apiClient,
    required this.networkMapper,
  });

  @override
  Future<List<Heroi>> getHerois({
    required int page,
    required int limit,
  }) async {
    final offset = (page - 1) * limit;

    final dbEntities =
        await heroiDao.selectAll(
      limit: limit,
      offset: offset,
    );

    if (dbEntities.length >= limit) {
      return databaseMapper.toHerois(
        dbEntities,
      );
    }

    try {
      final networkEntities =
          await apiClient.getHerois(
        page: page,
        limit: limit,
      );

      final herois =
          networkMapper.toHerois(
        networkEntities,
      );

      if (herois.isNotEmpty) {
        await heroiDao.insertAll(
          databaseMapper
              .toHeroiDatabaseEntities(
            herois,
          ),
        );
      }

      return herois;
    } catch (e) {
      if (dbEntities.isNotEmpty) {
        return databaseMapper.toHerois(
          dbEntities,
        );
      }

      rethrow;
    }
  }

  @override
  Future<Heroi?> getHeroiById(
    String id,
  ) async {
    final entity =
        await heroiDao.selectById(id);

    if (entity == null) {
      return null;
    }

    return databaseMapper.toHeroi(
      entity,
    );
  }
}