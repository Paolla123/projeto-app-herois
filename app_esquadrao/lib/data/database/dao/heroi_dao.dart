import 'package:sqflite/sqflite.dart';

import '../entity/heroi_database_entity.dart';
import 'base_dao.dart';

class HeroiDao extends BaseDao {
  Future<List<HeroiDatabaseEntity>> selectAll({
    int? limit,
    int? offset,
  }) async {
    final Database db = await getDb();

    final List<Map<String, dynamic>> maps = await db.query(
      HeroiDatabaseContract.heroiTable,
      limit: limit,
      offset: offset,
      orderBy:
          '${HeroiDatabaseContract.localIdColumn} ASC',
    );

    return List.generate(
      maps.length,
      (i) {
        return HeroiDatabaseEntity.fromJson(
          maps[i],
        );
      },
    );
  }

  Future<HeroiDatabaseEntity?> selectById(
    String id,
  ) async {
    final Database db = await getDb();

    final List<Map<String, dynamic>> maps =
        await db.query(
      HeroiDatabaseContract.heroiTable,
      where:
          '${HeroiDatabaseContract.idColumn} = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) {
      return null;
    }

    return HeroiDatabaseEntity.fromJson(
      maps.first,
    );
  }

  Future<int> count() async {
    final Database db = await getDb();

    final result = await db.rawQuery(
      'SELECT COUNT(*) FROM '
      '${HeroiDatabaseContract.heroiTable}',
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<void> insert(
    HeroiDatabaseEntity entity,
  ) async {
    final Database db = await getDb();

    await db.insert(
      HeroiDatabaseContract.heroiTable,
      entity.toJson(),
    );
  }

  Future<void> insertAll(
    List<HeroiDatabaseEntity> entities,
  ) async {
    final Database db = await getDb();

    await db.transaction(
      (transaction) async {
        for (final entity in entities) {
          transaction.insert(
            HeroiDatabaseContract.heroiTable,
            entity.toJson(),
          );
        }
      },
    );
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();

    await db.delete(
      HeroiDatabaseContract.heroiTable,
    );
  }
}