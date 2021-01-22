import 'dart:io';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LedgerMasterDBHelper {
  static final LedgerMasterDBHelper instance =
      LedgerMasterDBHelper._instance();
  static Database _db;

  LedgerMasterDBHelper._instance();

  String ledgerMasterTable = 'ledger_master_table';
  String _id = 'id';
  String _name = 'name';
  String _description = 'description';

  // LedgerMaster Tables
  // Id | Title | Date | Priority | Status
  // 0     ''      ''      ''         0
  // 2     ''      ''      ''         0
  // 3     ''      ''      ''         0

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/LedgerMaster.db';
    final ledgerMasterDB =
      await openDatabase(path, version: 1, onCreate: _createDb);
    return ledgerMasterDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $ledgerMasterTable($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_name TEXT, $_description TEXT,)',
    );
  }

  Future<List<Map<String, dynamic>>> getLedgerMasterMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(ledgerMasterTable);
    return result;
  }

  Future<List<LedgerMaster>> getLedgerMasterList() async {
    final List<Map<String, dynamic>> companyMapList = await getLedgerMasterMapList();
    final List<LedgerMaster> companyList = [];
    companyMapList.forEach((companyMap) {
      companyList.add(LedgerMaster.fromMap(companyMap));
    });
    // companyList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return companyList;
  }

  Future<int> insertLedgerMaster(LedgerMaster ledgerm) async {
    Database db = await this.db;
    final int result = await db.insert(ledgerMasterTable, ledgerm.toMap());
    return result;
  }

  Future<int> updateLedgerMaster(LedgerMaster ledgerm) async {
    Database db = await this.db;
    final int result = await db.update(
      ledgerMasterTable,
      ledgerm.toMap(),
      where: '$_id = ?',
      whereArgs: [ledgerm.id],
    );
    return result;
  }

  Future<int> deleteLedgerMaster(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      ledgerMasterTable,
      where: '$id = ?',
      whereArgs: [id],
    );
    return result;
  }
}