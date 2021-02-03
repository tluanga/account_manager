import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:sqflite/sqflite.dart';

class LedgerTransactionImpl implements LedgerTransactionService {
  Future<List<Map<String, dynamic>>> getLedgerTransactionMapList(
      {int id = 0, int startDate = 0, int endDate = 0}) async {
    print('id:$id--startDate:$startDate,------endate:$endDate');
    Database db = await DatabaseHelper.instance.db;
    if (id > 0 && startDate != 0) {
      final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT * FROM ledgerTranction_table
      WHERE id=$id    
      ''');
      // AND
      // date>$startDate AND date<$endDate
      print('inside the query');
      print(result.length.toString());
      return result;
    } else if (id > 0) {
      final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT * FROM ledgerTranction_table
      WHERE id=$id''');
      return result;
    } else {
      print('trying to get Ledger transaction List without parameter');
      final List<Map<String, dynamic>> result =
          await db.query('ledgerTranction_table');

      return result;
    }
  }

  Future<List<LedgerTransaction>> getList(
      {int id = 0, int startDate, int endDate}) async {
    final List<Map<String, dynamic>> ledgerTransactionMapList =
        await getLedgerTransactionMapList(
      id: id,
      startDate: startDate,
      endDate: endDate,
    );
    print(ledgerTransactionMapList.length.toString());
    final List<LedgerTransaction> ledgerTransactionList = [];
    ledgerTransactionMapList.forEach((ledgerTransactionMap) {
      ledgerTransactionList
          .add(LedgerTransaction.fromMap(ledgerTransactionMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return ledgerTransactionList;
  }

  Future<int> insert(LedgerTransaction ledgerTransaction) async {
    int ledgerId = ledgerTransaction.ledgerId;
    print('Before inserting Data the ledgerId is :$ledgerId');
    Database db = await DatabaseHelper.instance.db;

    final int result =
        await db.insert('ledgerTranction_table', ledgerTransaction.toMap());

    // --Get the ledger Transaction Resultt---
    List<LedgerTransaction> _ledgerTransaction = await getList(id: result);
    int ledgerID = _ledgerTransaction.first.ledgerId;
    final List<Map<String, dynamic>> _result = await db.rawQuery('''
      SELECT * FROM masterLedger_table
      WHERE id=$ledgerID    
      ''');
    print('--------Ledger Transation Created-----------');
    print(_ledgerTransaction.first.id.toString());
    print(_ledgerTransaction.first.amount.toString());
    print(_ledgerTransaction.first.cashOrBank.toString());
    print(_ledgerTransaction.first.debitOrCredit.toString());

    print(_result.first.toString());

    return result;
  }

  Future<int> update(LedgerTransaction ledgerTransaction) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'ledgerTranction_table',
      ledgerTransaction.toMap(),
      where: 'id = ?',
      whereArgs: [ledgerTransaction.id],
    );
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.delete(
      'ledgerTranction_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<int>> getIds() async {
    Database db = await DatabaseHelper.instance.db;
    List<Map<String, dynamic>> _allData = await db.rawQuery('''
     SELECT * FROM ledgerTranction_table
      ''');
    print('all data');
    print(_allData);
    List<Map<String, dynamic>> _data = await db.rawQuery('''
     SELECT DISTINCT  ledgerID FROM ledgerTranction_table
      ''');

    int convertToIntFromMap(Map<String, dynamic> map) {
      return map['ledgerId'];
    }

    final List<int> list = [];
    _data.forEach((element) {
      list.add(convertToIntFromMap(element));
    });

    return list;
  }
}
