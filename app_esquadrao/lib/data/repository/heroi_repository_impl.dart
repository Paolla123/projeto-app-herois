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
  Future<List<Heroi>> getHerois({required int page, required int limit}) async {
    // Tentar carregar a partir do banco de dados (Cache)
    final dbEntities = await heroiDao.selectAll(limit: limit, offset: (page * limit) - limit);
    
    // Se o dado já existe localmente, retorna ele direto
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toHerois(dbEntities);
    }
    
    //Caso contrário, busca pela API remota na internet
    final networkEntity = await apiClient.getHerois(page: page, limit: limit);
    final herois = networkMapper.toHerois(networkEntity);
    
    // alva os dados baixados no banco local (AGORA COM O AWAIT!)
    await heroiDao.insertAll(databaseMapper.toHeroiDatabaseEntities(herois));

    // Retorna os heróis com segurança
    return herois;
  }
}