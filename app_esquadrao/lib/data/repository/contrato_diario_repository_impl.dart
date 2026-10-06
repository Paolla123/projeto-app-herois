import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/heroi.dart';
import 'contrato_diario_repository.dart';
import 'heroi_repository.dart';

class ContratoDiarioRepositoryImpl
    implements ContratoDiarioRepository {
  final HeroiRepository heroiRepository;
  final SharedPreferences preferences;

  static const String _dataKey =
      'contrato_diario_data';

  static const String _heroiIdKey =
      'contrato_diario_heroi_id';

  static const int _pageSize = 20;

  static const int _totalPaginas = 29;

  ContratoDiarioRepositoryImpl({
    required this.heroiRepository,
    required this.preferences,
  });

  @override
  Future<Heroi> getHeroiDoDia() async {
    final hoje = _formatarData(
      DateTime.now(),
    );

    final dataSalva =
        preferences.getString(
      _dataKey,
    );

    final heroiIdSalvo =
        preferences.getString(
      _heroiIdKey,
    );

    if (dataSalva == hoje &&
        heroiIdSalvo != null) {
      final heroiSalvo =
          await heroiRepository
              .getHeroiById(
        heroiIdSalvo,
      );

      if (heroiSalvo != null) {
        return heroiSalvo;
      }
    }

    return _sortearNovoHeroi(
      hoje,
    );
  }

  Future<Heroi> _sortearNovoHeroi(
    String hoje,
  ) async {
    final random = Random();

    final pagina =
        random.nextInt(
              _totalPaginas,
            ) +
            1;

    final herois =
        await heroiRepository.getHerois(
      page: pagina,
      limit: _pageSize,
    );

    if (herois.isEmpty) {
      throw Exception(
        'Não foi possível sortear o herói do dia.',
      );
    }

    final heroi =
        herois[
          random.nextInt(
            herois.length,
          )
        ];

    await preferences.setString(
      _dataKey,
      hoje,
    );

    await preferences.setString(
      _heroiIdKey,
      heroi.id,
    );

    return heroi;
  }

  String _formatarData(
    DateTime data,
  ) {
    final ano =
        data.year.toString();

    final mes =
        data.month
            .toString()
            .padLeft(2, '0');

    final dia =
        data.day
            .toString()
            .padLeft(2, '0');

    return '$ano-$mes-$dia';
  }
}