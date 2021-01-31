import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';

import 'package:sqflite/sqflite.dart';

import '../../business_logic/models/transactionType.models.dart';

class TransactionTypeImpl implements TransactionTypeService {
  Future<List<Map<String, dynamic>>> gettransactionTypeMapList(
      {int id = 0}) async {
    Database db = await DatabaseHelper.instance.db;
    if (id != 0) {
      final List<Map<String, dynamic>> result = await db.query(
        'transactionType_table',
        where: 'id = ?',
        whereArgs: [id],
      );
      print('search result is $result');
      return result;
    } else {
      final List<Map<String, dynamic>> result = await db.query(
        'transactionType_table',
      );
      return result;
    }
  }

  Future<List<TransactionType>> getList({int id = 0}) async {
    final List<Map<String, dynamic>> transactionTypeMapList =
        await gettransactionTypeMapList(id: id);
    final List<TransactionType> transactionTypeList = [];
    transactionTypeMapList.forEach((transactionTypeMapList) {
      transactionTypeList.add(TransactionType.fromMap(transactionTypeMapList));
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
    return result;
  }
}
