class SquadDatabaseEntity {
  final int? localId;
  final String heroiId;

  SquadDatabaseEntity({
    this.localId,
    required this.heroiId,
  });

  factory SquadDatabaseEntity.fromMap(
    Map<String, dynamic> map,
  ) {
    return SquadDatabaseEntity(
      localId:
          map[SquadDatabaseContract.localIdColumn]
              as int?,
      heroiId:
          map[SquadDatabaseContract.heroiIdColumn]
              as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      SquadDatabaseContract.localIdColumn:
          localId,
      SquadDatabaseContract.heroiIdColumn:
          heroiId,
    };
  }
}

abstract class SquadDatabaseContract {
  static const String squadTable =
      'squad_table';

  static const String localIdColumn =
      'local_id';

  static const String heroiIdColumn =
      'heroi_id';
}