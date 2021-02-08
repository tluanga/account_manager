import 'package:account_manager/business_logic/models/transaction.model.dart'
    as trans;
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:sqflite/sqflite.dart';

class TransactionImpl implements TransactionService {
  Future<List<Map<String, dynamic>>> getTransactionMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('transaction_table');
    return result;
  }

  Future<List<trans.Transaction>> getList() async {
    final List<Map<String, dynamic>> transactionMapList =
        await getTransactionMapList();
    print(
      transactionMapList.length.toString(),
    );
    final List<trans.Transaction> transactionList = [];
    transactionMapList.forEach((transactionMap) {
      transactionList.add(trans.Transaction.fromMap(transactionMap));
    });
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return transactionList;
  }

  Future<int> insert(trans.Transaction transaction) async {
    Database db = await DatabaseHelper.instance.db;
    print(db);
    final int result =
        await db.insert('transaction_table', transaction.toMap());
    return result;
  }

  Future<int> update(trans.Transaction transaction) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.update(
      'transaction_table',
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.db;
    final int result = await db.delete(
      'transaction_table',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  // List<Transaction> _list = [
  //   Transaction(
  //     id: 1,
  //     amount: 2000,
  //     particular: 'Purchase of Electric Wire',
  //     date: DateTime.now(),
  //     transactionTypeId: 1,
  //     baOrPektlak: 1,
  //     cashOrBank: 1,
  //   )
  // ];

  // @override
  // Future<List<Transaction>> getTransactionList() async {
  //   return _list;
  // }

  // // Saving new Ledger Master
  // @override
  // Future<void> createNewTransaction(Transaction data) async {
  //   print(data.particular);
  //   _list.add(data);
  // }
  void creditAmountForMonth() async {
    Database db = await DatabaseHelper.instance.db;

    List<Map<String, dynamic>> _data = await db.rawQuery('''
    SELECT * 
    from transactionType_table
    ''');
    _data.forEach((element) {
      print('Element');
    });
  }
}

// Select
//     SUM(lt.[amount]) as[TotalAmount],
//     from ledgerTranction_table lt
//     INNER JOIN transactionType_table tt
//     ON lt.[transactionTypeId]=lt.[ID]
//     WHERE lt.sumChetVelDanType==$cLakluh &&
//     lt.sumChetVelDanType==$cHralh
