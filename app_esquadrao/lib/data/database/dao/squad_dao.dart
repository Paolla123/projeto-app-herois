import 'package:sqflite/sqflite.dart';

import '../entity/squad_database_entity.dart';
import 'base_dao.dart';

class SquadDao extends BaseDao {
  Future<int> count() async {
    final Database db = await getDb();

    final result = await db.rawQuery(
      'SELECT COUNT(*) FROM '
      '${SquadDatabaseContract.squadTable}',
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<bool> containsHero(
    String heroiId,
  ) async {
    final Database db = await getDb();

    final result = await db.query(
      SquadDatabaseContract.squadTable,
      where:
          '${SquadDatabaseContract.heroiIdColumn} = ?',
      whereArgs: [heroiId],
      limit: 1,
    );

    return result.isNotEmpty;
  }

  Future<void> insert(
    SquadDatabaseEntity entity,
  ) async {
    final Database db = await getDb();

    await db.insert(
      SquadDatabaseContract.squadTable,
      entity.toMap(),
    );
  }

  Future<List<SquadDatabaseEntity>>
      selectAll() async {
    final Database db = await getDb();

    final maps = await db.query(
      SquadDatabaseContract.squadTable,
      orderBy:
          '${SquadDatabaseContract.localIdColumn} ASC',
    );

    return maps
        .map(
          (map) =>
              SquadDatabaseEntity.fromMap(map),
        )
        .toList();
  }

  Future<void> deleteByHeroId(
    String heroiId,
  ) async {
    final Database db = await getDb();

    await db.delete(
      SquadDatabaseContract.squadTable,
      where:
          '${SquadDatabaseContract.heroiIdColumn} = ?',
      whereArgs: [heroiId],
    );
  }
}