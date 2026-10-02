import '../../domain/heroi.dart';

abstract class HeroiRepository {
  Future<List<Heroi>> getHerois({required int page, required int limit});
}