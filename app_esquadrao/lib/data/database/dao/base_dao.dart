import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../entity/heroi_database_entity.dart';

abstract class BaseDao {
  static const databaseVersion = 2;
  static const _databaseName = 'heroi_database.db';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        _databaseName,
      ),
      onCreate: (db, version) async {
        final batch = db.batch();

        _createHeroisTable(batch);

        await batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          final batch = db.batch();

          batch.execute(
            'DROP TABLE IF EXISTS ${HeroiDatabaseContract.heroiTable}',
          );

          _createHeroisTable(batch);

          await batch.commit();
        }
      },
      version: databaseVersion,
    );
  }

  void _createHeroisTable(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE ${HeroiDatabaseContract.heroiTable}(
        ${HeroiDatabaseContract.localIdColumn}
          INTEGER PRIMARY KEY AUTOINCREMENT,

        ${HeroiDatabaseContract.idColumn}
          TEXT NOT NULL,

        ${HeroiDatabaseContract.nomeColumn}
          TEXT NOT NULL,

        ${HeroiDatabaseContract.intelligenceColumn}
          INTEGER NOT NULL,

        ${HeroiDatabaseContract.strengthColumn}
          INTEGER NOT NULL,

        ${HeroiDatabaseContract.speedColumn}
          INTEGER NOT NULL,

        ${HeroiDatabaseContract.durabilityColumn}
          INTEGER NOT NULL,

        ${HeroiDatabaseContract.powerColumn}
          INTEGER NOT NULL,

        ${HeroiDatabaseContract.combatColumn}
          INTEGER NOT NULL,

        ${HeroiDatabaseContract.alturaColumn}
          TEXT NOT NULL,

        ${HeroiDatabaseContract.pesoColumn}
          TEXT NOT NULL,

        ${HeroiDatabaseContract.imgUrlColumn}
          TEXT NULL
      );
      ''',
    );
  }
}