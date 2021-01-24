import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:sqflite/sqflite.dart';

class TransactionTypeImpl implements TransactionTypeService {
  Future<List<Map<String, dynamic>>> getLedgerMasterMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('masterLedger_table');
    return result;
  }

  Future<List<TransactionType>> getList() async {
    final List<Map<String, dynamic>> ledgerMasterMapList =
        await getLedgerMasterMapList();
    final List<TransactionType> transactionTypeList = [];
    ledgerMasterMapList.forEach((ledgerMasterMap) {
      transactionTypeList.add(TransactionType.fromMap(ledgerMasterMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return transactionTypeList;
  }

  Future<int> insert(TransactionType transactionType) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result =
        await db.insert('transaction_table', transactionType.toMap());
    return result;
  }

  Future<int> update(TransactionType transactionType) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'masterLedger_table',
      transactionType.toMap(),
      where: 'id = ?',
      whereArgs: [transactionType.id],
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
