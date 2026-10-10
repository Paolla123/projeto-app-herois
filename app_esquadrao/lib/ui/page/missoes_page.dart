import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repository/missao_repository.dart';
import '../../data/repository/squad_repository.dart';
import '../../domain/heroi.dart';
import '../../domain/missao.dart';

class MissoesPage extends StatefulWidget {
  const MissoesPage({
    super.key,
  });

  @override
  State<MissoesPage> createState() =>
      _MissoesPageState();
}

class _MissoesPageState
    extends State<MissoesPage> {
  late Future<int> _quantidadeFuture;

  Missao? _missao;

  int _rodadaAtual = 0;

  final List<ResultadoRodada>
      _resultados = [];

  final Set<String>
      _agentesUsados = {};

  bool _carregando = false;
  bool _finalizando = false;

  @override
  void initState() {
    super.initState();

    final repository =
        Provider.of<SquadRepository>(
      context,
      listen: false,
    );

    _quantidadeFuture =
        repository.count();
  }

  Future<void> _iniciarMissao() async {
    setState(() {
      _carregando = true;
    });

    try {
      final repository =
          Provider.of<MissaoRepository>(
        context,
        listen: false,
      );

      final missao =
          await repository.criarMissao();

      if (!mounted) {
        return;
      }

      setState(() {
        _missao = missao;
        _rodadaAtual = 0;
        _resultados.clear();
        _agentesUsados.clear();
        _carregando = false;
      });
    } catch (e) {
      if (!mounted) {
        return;
      }

      setState(() {
        _carregando = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Não foi possível iniciar a missão.',
          ),
        ),
      );
    }
  }

  Future<void> _escolherAgente(
    Heroi agente,
  ) async {
    if (_finalizando ||
        _missao == null) {
      return;
    }

    final repository =
        Provider.of<MissaoRepository>(
      context,
      listen: false,
    );

    final rodada =
        _missao!
            .rodadas[_rodadaAtual];

    final resultado =
        repository.resolverRodada(
      rodada: rodada,
      agente: agente,
    );

    setState(() {
      _resultados.add(
        resultado,
      );

      _agentesUsados.add(
        agente.id,
      );
    });

    String mensagem;
    Color cor;

    if (resultado.venceu) {
      mensagem =
          'Vitória! ${resultado.valorAgente} x ${resultado.valorInimigo}';
      cor = Colors.green;
    } else if (resultado.empatou) {
      mensagem =
          'Empate! ${resultado.valorAgente} x ${resultado.valorInimigo}';
      cor = Colors.orange;
    } else {
      mensagem =
          'Derrota! ${resultado.valorAgente} x ${resultado.valorInimigo}';
      cor = Colors.red;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          mensagem,
        ),
        backgroundColor: cor,
        duration:
            const Duration(
          seconds: 1,
        ),
      ),
    );

    final ultimaRodada =
        _rodadaAtual ==
            _missao!.rodadas.length - 1;

    if (ultimaRodada) {
      await _finalizarMissao();
    } else {
      setState(() {
        _rodadaAtual++;
      });
    }
  }

  Future<void> _finalizarMissao() async {
    setState(() {
      _finalizando = true;
    });

    final repository =
        Provider.of<MissaoRepository>(
      context,
      listen: false,
    );

    final resultado =
        await repository.finalizarMissao(
      _resultados,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _finalizando = false;
    });

    AwesomeDialog(
      context: context,
      dialogType:
          resultado.sucesso
              ? DialogType.success
              : DialogType.error,
      title:
          resultado.sucesso
              ? 'Missão concluída!'
              : 'Missão falhou',
      desc:
          'Vitórias: ${resultado.vitorias}/${resultado.totalRodadas}\n\n'
          '${resultado.heroiRecompensado.nome} recebeu +1 em '
          '${resultado.atributoRecompensado.nome}.',
      btnOkText: 'Continuar',
      btnOkOnPress: () {
        _reiniciar();
      },
    ).show();
  }

  void _reiniciar() {
    setState(() {
      _missao = null;
      _rodadaAtual = 0;
      _resultados.clear();
      _agentesUsados.clear();
      _finalizando = false;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Missões',
          style: TextStyle(
            color: Colors.white,
            fontWeight:
                FontWeight.bold,
          ),
        ),
        backgroundColor:
            Colors.deepPurple,
        iconTheme:
            const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body:
          _missao == null
              ? _buildInicio()
              : _buildMissao(),
    );
  }

  Widget _buildInicio() {
    return FutureBuilder<int>(
      future: _quantidadeFuture,
      builder: (
        context,
        snapshot,
      ) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child:
                CircularProgressIndicator(),
          );
        }

        final quantidade =
            snapshot.data ?? 0;

        if (quantidade < 5) {
          return Center(
            child: Padding(
              padding:
                  const EdgeInsets.all(
                24,
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 70,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Esquadrão insuficiente',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Você possui $quantidade de 5 agentes necessários.',
                    textAlign:
                        TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return Center(
          child: Padding(
            padding:
                const EdgeInsets.all(
              24,
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.flag,
                  size: 80,
                  color:
                      Colors.deepPurple,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Missão disponível',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'A missão terá entre 3 e 5 rodadas. '
                  'Em cada rodada escolha um agente para enfrentar o inimigo.',
                  textAlign:
                      TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed:
                      _carregando
                          ? null
                          : _iniciarMissao,
                  child: Text(
                    _carregando
                        ? 'Preparando...'
                        : 'Iniciar missão',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMissao() {
    final rodada =
        _missao!
            .rodadas[_rodadaAtual];

    final agentesDisponiveis =
        _missao!.esquadrao
            .where(
              (heroi) =>
                  !_agentesUsados
                      .contains(
                    heroi.id,
                  ),
            )
            .toList();

    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            Text(
              'Rodada ${_rodadaAtual + 1} de '
              '${_missao!.rodadas.length}',
              textAlign:
                  TextAlign.center,
              style:
                  const TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              'Atributo: ${rodada.atributo.nome}',
              textAlign:
                  TextAlign.center,
              style:
                  const TextStyle(
                fontSize: 18,
                color:
                    Colors.deepPurple,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Inimigo',
                      style:
                          TextStyle(
                        fontSize: 16,
                        color:
                            Colors.grey,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    _buildImagemInimigo(
                      rodada.inimigo,
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    Text(
                      rodada.inimigo.nome,
                      style:
                          const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Text(
                      '${rodada.atributo.nome}: '
                      '${rodada.atributo.valorDo(rodada.inimigo)}',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
              'Escolha um agente:',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            if (_finalizando)
              const Center(
                child:
                    CircularProgressIndicator(),
              )
            else
              ...agentesDisponiveis.map(
                (heroi) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        heroi.nome,
                      ),
                      subtitle: Text(
                        '${rodada.atributo.nome}: '
                        '${rodada.atributo.valorDo(heroi)}',
                      ),
                      trailing:
                          const Icon(
                        Icons.chevron_right,
                      ),
                      onTap: () {
                        _escolherAgente(
                          heroi,
                        );
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagemInimigo(
    Heroi heroi,
  ) {
    if (heroi.imageUrl == null ||
        heroi.imageUrl!.isEmpty) {
      return const SizedBox(
        width: 120,
        height: 150,
        child: Icon(
          Icons.person,
          size: 70,
        ),
      );
    }

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(12),
      child: SizedBox(
        width: 120,
        height: 150,
        child:
            CachedNetworkImage(
          imageUrl:
              heroi.imageUrl!,
          fit: BoxFit.cover,
          errorWidget:
              (
                context,
                url,
                error,
              ) {
            return const Icon(
              Icons.broken_image,
              size: 60,
            );
          },
        ),
      ),
    );
  }
}