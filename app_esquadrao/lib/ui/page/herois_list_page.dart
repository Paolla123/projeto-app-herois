import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../domain/heroi.dart';
import '../../data/repository/heroi_repository_impl.dart';
import '../widgets/heroi_card.dart';

class HeroisListPage extends StatefulWidget {
  const HeroisListPage({super.key});

  @override
  State<HeroisListPage> createState() => _HeroisListPageState();
}

class _HeroisListPageState extends State<HeroisListPage> {
  late final HeroiRepositoryImpl heroisRepo;
  
  late final PagingController<int, Heroi> _pagingController = PagingController<int, Heroi>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => heroisRepo.getHerois(page: pageKey, limit: 20)
  );

  @override
  void initState() {
    super.initState();
    heroisRepo = Provider.of<HeroiRepositoryImpl>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Esquadrão de Heróis",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) => PagedListView<int, Heroi>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, heroi, index) => HeroiCard(heroi: heroi),
            ),
          ),
        )
    );
  }
}