import '../../domain/heroi.dart';
import '../database/dao/heroi_dao.dart';
import '../database/database_mapper.dart';
import '../network/client/api_client.dart';
import '../network/network_mapper.dart';
import 'heroi_repository.dart';

class HeroiRepositoryImpl implements HeroiRepository {
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

    // Primeiro tenta buscar a página no banco local.
    final dbEntities = await heroiDao.selectAll(
      limit: limit,
      offset: offset,
    );

    // Se o banco já possui uma página completa,
    // não precisamos consultar a internet.
    if (dbEntities.length >= limit) {
      return databaseMapper.toHerois(dbEntities);
    }

    try {
      // Busca SOMENTE a página solicitada pela tela.
      final networkEntities = await apiClient.getHerois(
        page: page,
        limit: limit,
      );

      // Converte os dados da API para o modelo usado pelo aplicativo.
      final herois = networkMapper.toHerois(networkEntities);

      // Salva os heróis recebidos no banco para uso posterior/offline.
      if (herois.isNotEmpty) {
        await heroiDao.insertAll(
          databaseMapper.toHeroiDatabaseEntities(herois),
        );
      }

      return herois;
    } catch (e) {
      // Se a internet/API falhar, tenta usar o que estiver
      // disponível no banco local.
      if (dbEntities.isNotEmpty) {
        return databaseMapper.toHerois(dbEntities);
      }

      rethrow;
    }
  }
}