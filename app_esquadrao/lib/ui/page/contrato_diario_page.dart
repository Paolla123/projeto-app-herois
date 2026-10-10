import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repository/contrato_diario_repository.dart';
import '../../data/repository/squad_repository.dart';
import '../../domain/heroi.dart';

class ContratoDiarioPage extends StatefulWidget {
  const ContratoDiarioPage({
    super.key,
  });

  @override
  State<ContratoDiarioPage> createState() =>
      _ContratoDiarioPageState();
}

class _ContratoDiarioPageState
    extends State<ContratoDiarioPage> {
  late Future<Heroi> _heroiFuture;

  bool _recrutando = false;

  @override
  void initState() {
    super.initState();

    final repository =
        Provider.of<ContratoDiarioRepository>(
      context,
      listen: false,
    );

    _heroiFuture =
        repository.getHeroiDoDia();
  }

  Future<void> _recrutar(
    Heroi heroi,
  ) async {
    if (_recrutando) {
      return;
    }

    setState(() {
      _recrutando = true;
    });

    final repository =
        Provider.of<SquadRepository>(
      context,
      listen: false,
    );

    final result =
        await repository.recruit(
      heroi,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _recrutando = false;
    });

    switch (result) {
      case RecruitResult.success:
        _mostrarMensagem(
          '${heroi.nome} foi recrutado!',
          Colors.green,
        );
        break;

      case RecruitResult.alreadyRecruited:
        _mostrarMensagem(
          '${heroi.nome} já está no esquadrão.',
          Colors.orange,
        );
        break;

      case RecruitResult.squadFull:
        _mostrarMensagem(
          'O esquadrão já possui 15 agentes.',
          Colors.red,
        );
        break;
    }
  }

  void _mostrarMensagem(
    String mensagem,
    Color cor,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          mensagem,
        ),
        backgroundColor: cor,
        duration:
            const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contrato Diário',
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
      body: FutureBuilder<Heroi>(
        future: _heroiFuture,
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

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.all(
                  24,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.grey,
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    const Text(
                      'Não foi possível carregar o contrato diário.',
                      textAlign:
                          TextAlign.center,
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final repository =
                              Provider.of<
                                ContratoDiarioRepository
                              >(
                            context,
                            listen:
                                false,
                          );

                          _heroiFuture =
                              repository
                                  .getHeroiDoDia();
                        });
                      },
                      child: const Text(
                        'Tentar novamente',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final heroi =
              snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .stretch,
                children: [
                  const Text(
                    'Agente disponível hoje',
                    textAlign:
                        TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  _buildImagem(
                    heroi,
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Text(
                    heroi.nome,
                    textAlign:
                        TextAlign.center,
                    style:
                        Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Card(
                    child: Padding(
                      padding:
                          const EdgeInsets
                              .all(20),
                      child: Column(
                        children: [
                          _buildAtributo(
                            'Poder',
                            heroi.power,
                          ),

                          const Divider(),

                          _buildAtributo(
                            'Força',
                            heroi.strength,
                          ),

                          const Divider(),

                          _buildAtributo(
                            'Velocidade',
                            heroi.speed,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton.icon(
                    onPressed:
                        _recrutando
                            ? null
                            : () =>
                                _recrutar(
                                  heroi,
                                ),
                    icon: const Icon(
                      Icons.person_add,
                    ),
                    label: Text(
                      _recrutando
                          ? 'Recrutando...'
                          : 'Recrutar agente',
                    ),
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          Colors
                              .deepPurple,
                      foregroundColor:
                          Colors.white,
                      padding:
                          const EdgeInsets
                              .symmetric(
                        vertical: 16,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  const Text(
                    'Este agente ficará disponível durante todo o dia.',
                    textAlign:
                        TextAlign.center,
                    style: TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImagem(
    Heroi heroi,
  ) {
    if (heroi.imageUrl == null ||
        heroi.imageUrl!.isEmpty) {
      return const SizedBox(
        height: 350,
        child: ColoredBox(
          color:
              Color(0xFFE0E0E0),
          child: Center(
            child: Icon(
              Icons
                  .image_not_supported,
              size: 70,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(
        16,
      ),
      child: SizedBox(
        height: 350,
        child:
            CachedNetworkImage(
          imageUrl:
              heroi.imageUrl!,
          fit: BoxFit.cover,
          placeholder:
              (
                context,
                url,
              ) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          },
          errorWidget:
              (
                context,
                url,
                error,
              ) {
            return const ColoredBox(
              color:
                  Color(
                    0xFFE0E0E0,
                  ),
              child: Center(
                child: Icon(
                  Icons
                      .broken_image,
                  size: 70,
                  color:
                      Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAtributo(
    String nome,
    int valor,
  ) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
        children: [
          Text(
            nome,
            style:
                const TextStyle(
              fontSize: 17,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          Text(
            valor.toString(),
            style:
                const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}