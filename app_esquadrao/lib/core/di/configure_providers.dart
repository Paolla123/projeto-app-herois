import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/database/dao/heroi_dao.dart';
import '../../data/database/database_mapper.dart';
import '../../data/network/client/api_client.dart';
import '../../data/network/network_mapper.dart';
import '../../data/repository/heroi_repository_impl.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {
    // À URL: 10.0.2.2 é o padrão do emulador Android para acessar o localhost do seu computador.
    // Usar o link da API que colocou no render (ex: "https://sua-api.onrender.com")
    final apiClient = ApiClient(baseUrl: "https://projeto-app-herois.onrender.com"); 
    final networkMapper = NetworkMapper();
    final databaseMapper = DatabaseMapper();
    final heroiDao = HeroiDao();

    final heroisRepository = HeroiRepositoryImpl(
      apiClient: apiClient,
      networkMapper: networkMapper,
      databaseMapper: databaseMapper,
      heroiDao: heroiDao,
    );

    return ConfigureProviders(providers: [
      Provider<ApiClient>.value(value: apiClient),
      Provider<NetworkMapper>.value(value: networkMapper),
      Provider<DatabaseMapper>.value(value: databaseMapper),
      Provider<HeroiDao>.value(value: heroiDao),
      Provider<HeroiRepositoryImpl>.value(value: heroisRepository),
    ]);
  }
}