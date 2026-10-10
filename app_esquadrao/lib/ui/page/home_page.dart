import 'package:flutter/material.dart';

import 'contrato_diario_page.dart';
import 'herois_list_page.dart';
import 'meu_esquadrao_page.dart';
import 'missoes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agência de Heróis',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.all(
            24.0,
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              _buildMenuButton(
                context,
                'Agentes',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              const HeroisListPage(),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),

              _buildMenuButton(
                context,
                'Contrato Diário',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              const ContratoDiarioPage(),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),

              _buildMenuButton(
                context,
                'Meu Esquadrão',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              const MeuEsquadraoPage(),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),

              _buildMenuButton(
                context,
                'Missões',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              const MissoesPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(
        backgroundColor:
            Colors.blue[700],
        foregroundColor:
            Colors.white,
        padding:
            const EdgeInsets
                .symmetric(
          vertical: 20,
        ),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
            12,
          ),
        ),
        textStyle:
            const TextStyle(
          fontSize: 20,
          fontWeight:
              FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}