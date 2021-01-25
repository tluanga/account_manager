import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgeMaster.service.dart';
import 'package:sqflite/sqflite.dart';

class LedgerTransactionImpl implements LedgerTransactionService {
  Future<List<Map<String, dynamic>>> getLedgerTransactionMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('masterLedger_table');
    return result;
  }

  Future<List<LedgerMaster>> getList() async {
    final List<Map<String, dynamic>> ledgerMasterMapList =
        await getLedgerMasterMapList();
    final List<LedgerMaster> ledgerMasterList = [];
    ledgerMasterMapList.forEach((ledgerMasterMap) {
      ledgerMasterList.add(LedgerMaster.fromMap(ledgerMasterMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return ledgerMasterList;
  }

  Future<int> insert(LedgerMaster ledgerMaster) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result =
        await db.insert('masterLedger_table', ledgerMaster.toMap());
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
}
