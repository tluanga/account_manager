// import 'package:account_manager/business_logic/models/tradingAccount.models.dart';
// import 'package:account_manager/services/database/databaseHelper.service.dart';
// import 'package:account_manager/services/tradingAccount/tradingAccount.service.dart';
// import 'package:sqflite/sqflite.dart';

// class TradingAccountImplementation implements TradingAccountService {
//   Future<List<TradingAccount>> getDirectExpense() async {
//     Database db = await DatabaseHelper.instance.db;

//     List<Map<String, dynamic>> _data = await db.rawQuery('''
//      SELECT  LedgerTransaction.amount   FROM ledgerTranction_table
//      INNER JOIN
//       ''');

//     int convertToIntFromMap(Map<String, dynamic> map) {
//       return map['ledgerId'];
//     }

//     final List<int> list = [];
//     _data.forEach((element) {
//       list.add(convertToIntFromMap(element));
//     });

//     return list;
//   }
// }

// // SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
// // FROM Orders
// // INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
