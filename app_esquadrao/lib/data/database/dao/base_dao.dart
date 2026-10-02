import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/heroi_database_entity.dart';

abstract class BaseDao {
  static const databaseVersion = 1;
  static const _databaseName = 'heroi_database.db';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createHeroisTableV1(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
  }

  void _createHeroisTableV1(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE ${HeroiDatabaseContract.heroiTable}(
      ${HeroiDatabaseContract.localIdColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${HeroiDatabaseContract.idColumn} TEXT NOT NULL,
      ${HeroiDatabaseContract.nomeColumn} TEXT NOT NULL,
      ${HeroiDatabaseContract.poderColumn} TEXT NOT NULL,
      ${HeroiDatabaseContract.imgUrl} TEXT NULL
      );
      '''
    );
  }
}