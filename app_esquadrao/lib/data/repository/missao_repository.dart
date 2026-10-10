import '../../domain/heroi.dart';
import '../../domain/missao.dart';

abstract class MissaoRepository {
  Future<Missao> criarMissao();

  ResultadoRodada resolverRodada({
    required RodadaMissao rodada,
    required Heroi agente,
  });

  Future<ResultadoMissao>
      finalizarMissao(
    List<ResultadoRodada> resultados,
  );
}