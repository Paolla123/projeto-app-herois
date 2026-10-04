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

  // Quantidade de heróis do catálogo na API:
  static const int _totalHerois = 563;

  // Quantidade máxima solicitada de uma vez para forçar o download completo:
  static const int _fullCacheLimit = 1000;

  HeroiRepositoryImpl({
      required this.heroiDao,
      required this.databaseMapper,
      required this.apiClient,
      required this.networkMapper,
  });

  // Função escudo: Garante que o catálogo inteiro seja baixado de uma vez só
  Future<void> _ensureFullCache() async {
    // Verifica quantos heróis já temos salvos no banco:
    final totalCached = await heroiDao.count();

    // Se já temos todos os 563, aborta a busca na internet:
    if (totalCached >= _totalHerois) {
      return;
    }

    // Busca todo o catálogo na API de uma vez (burlando a paginação lenta):
    final networkEntities = await apiClient.getHerois(
      page: 1,
      limit: _fullCacheLimit,
    );

    // Converte os dados da API:
    final herois = networkMapper.toHerois(networkEntities);

    // Salva todo o catálogo no banco local de uma vez só com o AWAIT:
    await heroiDao.insertAll(
      databaseMapper.toHeroiDatabaseEntities(herois),
    );
  }

  @override
  Future<List<Heroi>> getHerois({required int page, required int limit}) async {
    // Calcula de onde o banco de dados deve começar a ler a página:
    final offset = (page * limit) - limit;

    // Busca os dados localmente primeiro:
    final dbEntities = await heroiDao.selectAll(
      limit: limit,
      offset: offset,
    );

    // Verifica o tamanho do nosso cache local:
    final totalCached = await heroiDao.count();

    // Se o catálogo já está completo, retorna do banco na hora (sem travar):
    if (totalCached >= _totalHerois) {
      return databaseMapper.toHerois(dbEntities);
    }

    try {
      // Se o banco ainda está vazio ou incompleto, aciona a função escudo:
      await _ensureFullCache();

      // Busca novamente no banco, agora que ele está cheio de dados:
      final updatedEntities = await heroiDao.selectAll(
        limit: limit,
        offset: offset,
      );

      return databaseMapper.toHerois(updatedEntities);
    } catch (e) {
      // Se der algum erro (ex: sem internet), usa o que já estiver salvo para não quebrar:
      if (dbEntities.isNotEmpty) {
        return databaseMapper.toHerois(dbEntities);
      }
      rethrow;
    }
  }
}