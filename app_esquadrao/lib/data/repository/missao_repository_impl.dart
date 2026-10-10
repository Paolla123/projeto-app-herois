import 'dart:math';

import '../../domain/heroi.dart';
import '../../domain/missao.dart';
import '../database/dao/heroi_dao.dart';
import '../database/database_mapper.dart';
import 'heroi_repository.dart';
import 'missao_repository.dart';
import 'squad_repository.dart';

class MissaoRepositoryImpl
    implements MissaoRepository {
  final HeroiRepository heroiRepository;
  final SquadRepository squadRepository;
  final HeroiDao heroiDao;
  final DatabaseMapper databaseMapper;

  final Random _random = Random();

  MissaoRepositoryImpl({
    required this.heroiRepository,
    required this.squadRepository,
    required this.heroiDao,
    required this.databaseMapper,
  });

  @override
  Future<Missao> criarMissao() async {
    final esquadrao =
        await squadRepository.getSquad();

    if (esquadrao.length < 5) {
      throw Exception(
        'É necessário ter pelo menos 5 agentes.',
      );
    }

    final catalogo =
        await heroiRepository.getHerois(
      page: 1,
      limit: 20,
    );

    final idsEsquadrao =
        esquadrao
            .map(
              (heroi) => heroi.id,
            )
            .toSet();

    final inimigos =
        catalogo
            .where(
              (heroi) =>
                  !idsEsquadrao
                      .contains(
                    heroi.id,
                  ),
            )
            .toList();

    if (inimigos.isEmpty) {
      throw Exception(
        'Não foi possível encontrar inimigos.',
      );
    }

    final totalRodadas =
        3 + _random.nextInt(3);

    final List<RodadaMissao> rodadas = [];

    for (int i = 0;
        i < totalRodadas;
        i++) {
      final atributo =
          AtributoMissao.values[
              _random.nextInt(
                AtributoMissao
                    .values.length,
              )
          ];

      final inimigo =
          inimigos[
              _random.nextInt(
                inimigos.length,
              )
          ];

      rodadas.add(
        RodadaMissao(
          atributo: atributo,
          inimigo: inimigo,
        ),
      );
    }

    return Missao(
      esquadrao: esquadrao,
      rodadas: rodadas,
    );
  }

  @override
  ResultadoRodada resolverRodada({
    required RodadaMissao rodada,
    required Heroi agente,
  }) {
    final valorAgente =
        rodada.atributo.valorDo(
      agente,
    );

    final valorInimigo =
        rodada.atributo.valorDo(
      rodada.inimigo,
    );

    return ResultadoRodada(
      rodada: rodada,
      agente: agente,
      valorAgente: valorAgente,
      valorInimigo: valorInimigo,
      venceu:
          valorAgente > valorInimigo,
      empatou:
          valorAgente == valorInimigo,
    );
  }

  @override
  Future<ResultadoMissao>
      finalizarMissao(
    List<ResultadoRodada> resultados,
  ) async {
    final vitorias =
        resultados
            .where(
              (resultado) =>
                  resultado.venceu,
            )
            .length;

    final sucesso =
        vitorias >
            resultados.length / 2;

    final participantes =
        <String, Heroi>{};

    for (final resultado
        in resultados) {
      participantes[
          resultado.agente.id] =
          resultado.agente;
    }

    final listaParticipantes =
        participantes.values.toList();

    final heroi =
        listaParticipantes[
          _random.nextInt(
            listaParticipantes.length,
          )
        ];

    final atributosDisponiveis =
        AtributoMissao.values
            .where(
              (atributo) =>
                  atributo.valorDo(
                    heroi,
                  ) <
                  100,
            )
            .toList();

    final atributo =
        atributosDisponiveis.isEmpty
            ? AtributoMissao.values[
                _random.nextInt(
                  AtributoMissao
                      .values.length,
                )
              ]
            : atributosDisponiveis[
                _random.nextInt(
                  atributosDisponiveis
                      .length,
                )
              ];

    final heroiAtualizado =
        _aumentarAtributo(
      heroi,
      atributo,
    );

    await heroiDao.update(
      databaseMapper
          .toHeroiDatabaseEntity(
        heroiAtualizado,
      ),
    );

    return ResultadoMissao(
      vitorias: vitorias,
      totalRodadas:
          resultados.length,
      sucesso: sucesso,
      heroiRecompensado:
          heroiAtualizado,
      atributoRecompensado:
          atributo,
    );
  }

  Heroi _aumentarAtributo(
    Heroi heroi,
    AtributoMissao atributo,
  ) {
    switch (atributo) {
      case AtributoMissao.intelligence:
        return heroi.copyWith(
          intelligence:
              heroi.intelligence < 100
                  ? heroi.intelligence + 1
                  : 100,
        );

      case AtributoMissao.strength:
        return heroi.copyWith(
          strength:
              heroi.strength < 100
                  ? heroi.strength + 1
                  : 100,
        );

      case AtributoMissao.speed:
        return heroi.copyWith(
          speed:
              heroi.speed < 100
                  ? heroi.speed + 1
                  : 100,
        );

      case AtributoMissao.durability:
        return heroi.copyWith(
          durability:
              heroi.durability < 100
                  ? heroi.durability + 1
                  : 100,
        );

      case AtributoMissao.power:
        return heroi.copyWith(
          power:
              heroi.power < 100
                  ? heroi.power + 1
                  : 100,
        );

      case AtributoMissao.combat:
        return heroi.copyWith(
          combat:
              heroi.combat < 100
                  ? heroi.combat + 1
                  : 100,
        );
    }
  }
}