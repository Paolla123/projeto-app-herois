import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/database/dao/heroi_dao.dart';
import '../../data/database/database_mapper.dart';
import '../../data/network/client/api_client.dart';
import '../../data/network/network_mapper.dart';
import '../../data/repository/contrato_diario_repository.dart';
import '../../data/repository/contrato_diario_repository_impl.dart';
import '../../data/repository/heroi_repository.dart';
import '../../data/repository/heroi_repository_impl.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({
    required this.providers,
  });

  static Future<ConfigureProviders>
      createDependencyTree() async {
    final apiClient = ApiClient(
      baseUrl:
          'https://projeto-app-herois.onrender.com',
    );

    final networkMapper =
        NetworkMapper();

    final databaseMapper =
        DatabaseMapper();

    final heroiDao =
        HeroiDao();

    final preferences =
        await SharedPreferences.getInstance();

    final heroisRepository =
        HeroiRepositoryImpl(
      apiClient: apiClient,
      networkMapper: networkMapper,
      databaseMapper: databaseMapper,
      heroiDao: heroiDao,
    );

    final contratoDiarioRepository =
        ContratoDiarioRepositoryImpl(
      heroiRepository:
          heroisRepository,
      preferences:
          preferences,
    );

    return ConfigureProviders(
      providers: [
        Provider<ApiClient>.value(
          value: apiClient,
        ),
        Provider<NetworkMapper>.value(
          value: networkMapper,
        ),
        Provider<DatabaseMapper>.value(
          value: databaseMapper,
        ),
        Provider<HeroiDao>.value(
          value: heroiDao,
        ),
        Provider<SharedPreferences>.value(
          value: preferences,
        ),
        Provider<HeroiRepository>.value(
          value: heroisRepository,
        ),
        Provider<HeroiRepositoryImpl>.value(
          value: heroisRepository,
        ),
        Provider<ContratoDiarioRepository>
            .value(
          value:
              contratoDiarioRepository,
        ),
      ],
    );
  }
}