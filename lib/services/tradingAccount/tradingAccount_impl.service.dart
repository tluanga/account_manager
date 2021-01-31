import 'package:account_manager/business_logic/models/tradingAccount.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/tradingAccount/tradingAccount.service.dart';
import 'package:sqflite/sqflite.dart';

class TradingAccountImplementation implements TradingAccountService {
  Future<List<DirectExpense>> getDirectExpense() async {
    Database db = await DatabaseHelper.instance.db;

    final List<Map<String, dynamic>> ledgerTransactionMapList =
        await db.rawQuery('''
     SELECT
      ledgerTranction_table.ledgerId,
      masterLedger_table.name,
      ledgerTranction_table.date,      
      ledgerTranction_table.amount,
      ledgerTranction_table.particular,
      ledgerTranction_table.debitOrCredit,
      masterLedger_table.party,
      masterLedger_table.directOrIndirect      
      FROM ledgerTranction_table      
      INNER JOIN masterLedger_table ON masterLedger_table.id=ledgerTranction_table.ledgerId
      WHERE masterLedger_table.directOrIndirect=0
      
      ''');

    print(ledgerTransactionMapList.length.toString());
    final List<DirectExpense> ledgerTransactionList = [];
    ledgerTransactionMapList.forEach((ledgerTransactionMap) {
      ledgerTransactionList.add(DirectExpense.fromMap(ledgerTransactionMap));
    });

    // --Get distinc list of id from the ledgertransactiontable
    final List<Map<String, dynamic>> ledgerTransactionMapListLedgerId =
        await db.rawQuery('''
     SELECT DISTINCE
            ledgerTranction_table.ledgerId    
          
      FROM ledgerTranction_table      
      INNER 
        JOIN
           masterLedger_table 
           ON 
           masterLedger_table.id=ledgerTranction_table.ledgerId
      WHERE masterLedger_table.directOrIndirect=0
      ORDER BY ledgerTranction_table.ledgerId
      
      ''');

    print(ledgerTransactionMapListLedgerId.length.toString());
    // taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return ledgerTransactionList;
  }
}

// SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
// FROM Orders
// INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
