import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../../business_logic/models/transaction.model.dart';
import '../../business_logic/models/transactionType.models.dart';

class TransactionTypeImpl implements TransactionTypeService {
  Future<List<Map<String, dynamic>>> getLedgerMasterMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('transactionType_table');
    return result;
  }

  Future<List<TransactionType>> getList() async {
    final List<Map<String, dynamic>> ledgerMasterMapList =
        await getLedgerMasterMapList();
    final List<TransactionType> transactionTypeList = [];
    ledgerMasterMapList.forEach((ledgerMasterMap) {
      transactionTypeList.add(TransactionType.fromMap(ledgerMasterMap));
    });
    
    return transactionTypeList;
  }

  Future<int> insert(TransactionType transactionType) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result =
        await db.insert('transactionType_table', transactionType.toMap());
    return result;
  }

  Future<int> update(TransactionType transactionType) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'transactionType_table',
      transactionType.toMap(),
      where: 'id = ?',
      whereArgs: [transactionType.id],
    );
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.delete(
      'transactionType_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;showCupertinoModalPopup(context: null, builder: null)
  }

  Future<TransactionType> find(int id) async {
    Database db = await DatabaseHelper.instance.db;
    var map = db.query(
      'transactionType_table',
      where: 'id==?',
      whereArgs: [id],
    );
    return TransactionType.fromMap(map) ;
  }
}
