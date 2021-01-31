import 'package:account_manager/business_logic/models/accountingYear_model.dart';

import 'package:account_manager/services/accountingYear/accountingYear.service.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:sqflite/sqflite.dart';

class AccountingYearImpl implements AccountingYearService {
  Future<List<Map<String, dynamic>>> accountingYearMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('accountingYear_table');
    return result;
  }

  Future<List<AccountingYear>> getList() async {
    final List<Map<String, dynamic>> ledgerMasterMapList =
        await accountingYearMapList();
    final List<AccountingYear> ledgerMasterList = [];
    ledgerMasterMapList.forEach((accountingYearMap) {
      ledgerMasterList.add(AccountingYear.fromMap(accountingYearMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return ledgerMasterList;
  }

  Future<int> insert(AccountingYear accountingYear) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result =
        await db.insert('accountingYear_table', accountingYear.toMap());
    return result;
  }

  Future<int> update(AccountingYear accountingYear) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'accountingYear_table',
      accountingYear.toMap(),
      where: 'id = ?',
      whereArgs: [accountingYear.id],
    );
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.delete(
      'accountingYear_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }
}
