import '../../domain/heroi.dart';

enum RecruitResult {
  success,
  alreadyRecruited,
  squadFull,
}

abstract class SquadRepository {
  Future<RecruitResult> recruit(
    Heroi heroi,
  );

  Future<List<Heroi>> getSquad();

  Future<void> remove(
    String heroiId,
  );

  Future<int> count();
}