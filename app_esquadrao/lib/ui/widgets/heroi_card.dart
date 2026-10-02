import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/heroi.dart';

class HeroiCard extends StatelessWidget {
  final Heroi heroi;

  const HeroiCard({super.key, required this.heroi});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        children: [
          // Lado esquerdo: Imagem do herói
          if (heroi.imageUrl != null)
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 100,
                height: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  // CachedNetworkImage baixa a imagem e guarda no celular para não baixar de novo
                  child: CachedNetworkImage(
                    imageUrl: heroi.imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            )
          else
            const SizedBox(
              width: 100,
              height: 150,
              child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
            ),
            
          // Lado direito: Informações (Nome e Poder)
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heroi.nome,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Poder:",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    heroi.poder,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}