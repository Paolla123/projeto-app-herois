import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/heroi.dart';
import '../page/heroi_detail_page.dart';

class HeroiCard extends StatelessWidget {
  final Heroi heroi;

  const HeroiCard({
    super.key,
    required this.heroi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HeroiDetailPage(heroi: heroi),
            ),
          );
        },
        child: SizedBox(
          height: 170,
          child: Row(
            children: [
              SizedBox(
                width: 110,
                height: 170,
                child: _buildImagem(),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        heroi.nome,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 10),

                      _buildInformacao(
                        'Poder',
                        heroi.power.toString(),
                      ),
                      _buildInformacao(
                        'Força',
                        heroi.strength.toString(),
                      ),
                      _buildInformacao(
                        'Velocidade',
                        heroi.speed.toString(),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        heroi.altura,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInformacao(
    String titulo,
    String valor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          Text(
            '$titulo: ',
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(valor),
        ],
      ),
    );
  }

  Widget _buildImagem() {
    if (heroi.imageUrl == null ||
        heroi.imageUrl!.isEmpty) {
      return const ColoredBox(
        color: Color(0xFFE0E0E0),
        child: Center(
          child: Icon(
            Icons.image_not_supported,
            size: 40,
            color: Colors.grey,
          ),
        ),
      );
    }

    return CachedNetworkImage(
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
              size: 40,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}