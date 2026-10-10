import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repository/squad_repository.dart';
import '../../domain/heroi.dart';
import 'heroi_detail_page.dart';

class MeuEsquadraoPage extends StatefulWidget {
  const MeuEsquadraoPage({
    super.key,
  });

  @override
  State<MeuEsquadraoPage> createState() =>
      _MeuEsquadraoPageState();
}

class _MeuEsquadraoPageState
    extends State<MeuEsquadraoPage> {
  late Future<List<Heroi>> _heroisFuture;

  @override
  void initState() {
    super.initState();

    _carregarEsquadrao();
  }

  void _carregarEsquadrao() {
    final repository =
        Provider.of<SquadRepository>(
      context,
      listen: false,
    );

    _heroisFuture =
        repository.getSquad();
  }

  Future<void> _removerHeroi(
    Heroi heroi,
  ) async {
    final repository =
        Provider.of<SquadRepository>(
      context,
      listen: false,
    );

    await repository.remove(
      heroi.id,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _carregarEsquadrao();
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          '${heroi.nome} foi removido.',
        ),
      ),
    );
  }

  void _confirmarRemocao(
    Heroi heroi,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      title: 'Remover agente?',
      desc:
          'Deseja remover ${heroi.nome} do esquadrão?',
      btnCancelText: 'Cancelar',
      btnOkText: 'Remover',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        _removerHeroi(
          heroi,
        );
      },
    ).show();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu Esquadrão',
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
          FutureBuilder<List<Heroi>>(
        future: _heroisFuture,
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
            return const Center(
              child: Text(
                'Não foi possível carregar o esquadrão.',
              ),
            );
          }

          final herois =
              snapshot.data ?? [];

          if (herois.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.groups_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Seu esquadrão está vazio.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Recrute um agente no Contrato Diário.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.all(
                  16,
                ),
                child: Text(
                  '${herois.length} / 15 agentes',
                  style:
                      const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child:
                    ListView.builder(
                  itemCount:
                      herois.length,
                  itemBuilder:
                      (
                        context,
                        index,
                      ) {
                    final heroi =
                        herois[index];

                    return Card(
                      margin:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets
                                .all(8),
                        leading:
                            _buildImagem(
                          heroi,
                        ),
                        title: Text(
                          heroi.nome,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Poder: ${heroi.power}  •  Força: ${heroi.strength}',
                        ),
                        trailing:
                            IconButton(
                          icon:
                              const Icon(
                            Icons.delete,
                            color:
                                Colors.red,
                          ),
                          onPressed: () {
                            _confirmarRemocao(
                              heroi,
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      HeroiDetailPage(
                                heroi:
                                    heroi,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
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
        width: 60,
        height: 70,
        child: Icon(
          Icons.person,
          size: 40,
        ),
      );
    }

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(8),
      child: SizedBox(
        width: 60,
        height: 70,
        child: CachedNetworkImage(
          imageUrl: heroi.imageUrl!,
          fit: BoxFit.cover,
          errorWidget:
              (
                context,
                url,
                error,
              ) {
            return const Icon(
              Icons.broken_image,
            );
          },
        ),
      ),
    );
  }
}