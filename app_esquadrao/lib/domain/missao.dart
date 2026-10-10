import 'heroi.dart';

enum AtributoMissao {
  intelligence,
  strength,
  speed,
  durability,
  power,
  combat,
}

extension AtributoMissaoExtension
    on AtributoMissao {
  String get nome {
    switch (this) {
      case AtributoMissao.intelligence:
        return 'Inteligência';

      case AtributoMissao.strength:
        return 'Força';

      case AtributoMissao.speed:
        return 'Velocidade';

      case AtributoMissao.durability:
        return 'Durabilidade';

      case AtributoMissao.power:
        return 'Poder';

      case AtributoMissao.combat:
        return 'Combate';
    }
  }

  int valorDo(
    Heroi heroi,
  ) {
    switch (this) {
      case AtributoMissao.intelligence:
        return heroi.intelligence;

      case AtributoMissao.strength:
        return heroi.strength;

      case AtributoMissao.speed:
        return heroi.speed;

      case AtributoMissao.durability:
        return heroi.durability;

      case AtributoMissao.power:
        return heroi.power;

      case AtributoMissao.combat:
        return heroi.combat;
    }
  }
}

class RodadaMissao {
  final AtributoMissao atributo;
  final Heroi inimigo;

  RodadaMissao({
    required this.atributo,
    required this.inimigo,
  });
}

class Missao {
  final List<Heroi> esquadrao;
  final List<RodadaMissao> rodadas;

  Missao({
    required this.esquadrao,
    required this.rodadas,
  });
}

class ResultadoRodada {
  final RodadaMissao rodada;
  final Heroi agente;
  final int valorAgente;
  final int valorInimigo;
  final bool venceu;
  final bool empatou;

  ResultadoRodada({
    required this.rodada,
    required this.agente,
    required this.valorAgente,
    required this.valorInimigo,
    required this.venceu,
    required this.empatou,
  });
}

class ResultadoMissao {
  final int vitorias;
  final int totalRodadas;
  final bool sucesso;

  final Heroi heroiRecompensado;
  final AtributoMissao
      atributoRecompensado;

  ResultadoMissao({
    required this.vitorias,
    required this.totalRodadas,
    required this.sucesso,
    required this.heroiRecompensado,
    required this.atributoRecompensado,
  });
}