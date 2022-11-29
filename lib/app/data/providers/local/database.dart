import 'dart:convert';
import 'dart:developer';

import 'package:get/get_core/src/get_main.dart';
import 'package:my_caffee/app/data/providers/local/dao/cart_dao.dart';
import 'package:sqflite/sqflite.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class LocalDatabaseApi {
  late Database _database;
  late CartDao? _cartDao;
  final String dbName = 'm.db';

  Database? get database => _database;
  CartDao? get cartDao => _cartDao;

  Future<Database> open() async {
    String dbDir = await getDatabasesPath();
    String path = '$dbDir\\$dbName';
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => _initializeDao(db, true),
      onOpen: (db) => _initializeDao(db, false),
    );

    return _database;
  }

  Future _initializeDao(db, createTables) async {
    log('called');
    _cartDao = CartDao(database: db);
    if (createTables) {
      await _cartDao!.createTable();
    }

    Get.log('database opened : ${db.toString()}');
  }

  Future close() async {
    await _database.close();
    Get.log('database closed : ${_database.toString()}');
  }

  Future destroy() async {
    String dbDir = await getDatabasesPath();
    String path = '$dbDir\\$dbName';
    await deleteDatabase(path);
  }

  bool isDatabaseOpen() => _database.isOpen;
}
