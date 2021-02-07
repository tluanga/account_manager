import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';

import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:sqflite/sqflite.dart';

import '../../static/constants.dart';

class LedgerMasterImpl implements LedgerMasterService {
  Future<List<Map<String, dynamic>>> getLedgerMasterMapList() async {
    Database db = await DatabaseHelper.instance.db;

    final List<Map<String, dynamic>> result =
        await db.query('masterLedger_table');
    return result;
  }

  Future<List<LedgerMaster>> getList({int id = 0}) async {
    final List<Map<String, dynamic>> ledgerMasterMapList =
        await getLedgerMasterMapList();
    final List<LedgerMaster> ledgerMasterList = [];
    ledgerMasterMapList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return ledgerMasterList;
  }

  Future<LedgerMaster> getLedgerMaster(int id) async {
    Database db = await DatabaseHelper.instance.db;

    List<Map<String, dynamic>> _data = await db.rawQuery('''
     SELECT * FROM masterLedger_table where id=$id
      ''');
    LedgerMaster _ledgerMaster;
    _ledgerMaster = LedgerMaster.fromMap(_data[0]);
    return _ledgerMaster;
  }

  Future<int> insert(LedgerMaster ledgerMaster) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result =
        await db.insert(DatabaseHelper.masterLedgerTable, ledgerMaster.toMap());
    return result;
  }

  Future<int> update(LedgerMaster ledgerMaster) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'masterLedger_table',
      ledgerMaster.toMap(),
      where: 'id = ?',
      whereArgs: [ledgerMaster.id],
    );
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.delete(
      'masterLedger_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  //------Search Party
  Future<List<LedgerMaster>> searchPartyList(String _searchString) async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE party=$cPartyAc
      ''');
    print('all data');
    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });

    return ledgerMasterList;
  }

  Future<List<LedgerMaster>> getAssetLedgerList() async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE asset=$cASSET
      ''');
    print('all data');
    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });

    return ledgerMasterList;
  }

  Future<List<LedgerMaster>> getFilterdLedgerList(String _searchString) async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE asset=$cASSET AND name LIKE '$_searchString%'
      ''');
    print(_partyList.length.toString());
    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));

      return ledgerMasterList;
    });
  }

  Future<List<LedgerMaster>> getFilterdPartyLedgerList(
      String _searchString) async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE name LIKE '$_searchString%' AND party=$cPartyAc
      ''');
    String length = _partyList.length.toString();
    // print('The Search yield $length');
    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });
    if (_partyList.length == 0) return [];

    return ledgerMasterList;
  }

  Future<List<LedgerMaster>> getPartyList() async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE party=$cPartyAc
      ''');
    ;
    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });

    return ledgerMasterList;
  }

  Future<String> getLedgerMasterName(int _id) async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE id=$_id%
      ''');

    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });
    return ledgerMasterList[0].name;
  }

  Future<List<LedgerMaster>> getTopTenLedgerList() async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _partyList = await db.rawQuery('''
     SELECT m.name, m.description FROM masterLedger_table m
      INNER JOIN ledgerTranction_table  ON m.id=ledgerTranction_table.ledgerID
      ''');

    final List<LedgerMaster> ledgerMasterList = [];
    _partyList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });
    return ledgerMasterList;
  }

  Future<List<LedgerMaster>> getFilteredAssetList(String _searchString) async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _assetList = await db.rawQuery('''
     SELECT * FROM masterLedger_table
     WHERE name LIKE '$_searchString%' AND asset=$cASSET
      ''');

    final List<LedgerMaster> ledgerMasterList = [];
    _assetList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });

    return ledgerMasterList;
  }
}
