import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

import '../../domain/heroi.dart';

class HeroiDetailPage extends StatelessWidget {
  final Heroi heroi;

  const HeroiDetailPage({
    super.key,
    required this.heroi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          heroi.nome,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImagem(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heroi.nome,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Atributos',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 16),

                  _buildPowerstat(
                    'Inteligência',
                    heroi.intelligence,
                  ),
                  _buildPowerstat(
                    'Força',
                    heroi.strength,
                  ),
                  _buildPowerstat(
                    'Velocidade',
                    heroi.speed,
                  ),
                  _buildPowerstat(
                    'Durabilidade',
                    heroi.durability,
                  ),
                  _buildPowerstat(
                    'Poder',
                    heroi.power,
                  ),
                  _buildPowerstat(
                    'Combate',
                    heroi.combat,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Aparência',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 16),

                  _buildAparencia(
                    'Altura',
                    _formatarAltura(heroi.altura),
                  ),

                  const SizedBox(height: 10),

                  _buildAparencia(
                    'Peso',
                    _formatarPeso(heroi.peso),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagem() {
    if (heroi.imageUrl == null ||
        heroi.imageUrl!.isEmpty) {
      return const SizedBox(
        height: 350,
        child: ColoredBox(
          color: Color(0xFFE0E0E0),
          child: Center(
            child: Icon(
              Icons.image_not_supported,
              size: 70,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 350,
      child: CachedNetworkImage(
        imageUrl: heroi.imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorWidget: (context, url, error) {
          return const ColoredBox(
            color: Color(0xFFE0E0E0),
            child: Center(
              child: Icon(
                Icons.broken_image,
                size: 70,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPowerstat(
    String nome,
    int valor,
  ) {
    final valorSeguro = valor.clamp(0, 100);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nome,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$valorSeguro/100',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          PrimerProgressBar(
            segments: [
              Segment(
                value: valorSeguro,
                color: Colors.deepPurple,
              ),
              Segment(
                value: 100 - valorSeguro,
                color: Colors.black12,
              ),
            ],
            maxTotalValue: 100,
            showLegend: false,
          ),
        ],
      ),
    );
  }

  Widget _buildAparencia(
    String titulo,
    String valor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$titulo: ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            valor,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  String _formatarAltura(String altura) {
    final valor = altura.trim();

    if (valor.isEmpty ||
        valor == '-' ||
        valor.contains('0 cm')) {
      return 'Não informada';
    }

    return valor;
  }

  String _formatarPeso(String peso) {
    final valor = peso.trim();

    if (valor.isEmpty ||
        valor == '-' ||
        valor.contains('0 kg')) {
      return 'Não informado';
    }

    return valor;
  }
}