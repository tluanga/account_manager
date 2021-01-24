// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._instance();
//   static Database _db;

//   DatabaseHelper._instance();

//   String transactionTable = 'transaction_table';
//   String transactionTypeTable = 'transactionType_table';
//   String masterLedgerTable = 'masterLedger_table';

//   //transactionTable
//   String colId = 'id';
//   String colAmount = 'amount';
//   String colDate = 'date';
//   String colParticulars = 'particulars';
//   String colInout = 'inout';
//   String colDeptpaid = 'deptpaid';
//   String colCashCheaque = 'cashcheaque';
//   String colStatus = 'status';

//   //typeTable
//   String typeId = 'id';
//   String typeName = 'name';
//   String typeDescription = 'description';

//   //MasterLedgeTable
//   String mledgerId = 'id';
//   String mledgerName = 'name';
//   String mledgerDescription = 'description';

//   // Task Tables
//   // Id | Title | Date | Priority | Status
//   // 0     ''      ''       ''       0or1

//   Future<Database> get db async {
//     if (_db == null) {
//       _db = await _initDb();
//     }
//     return _db;
//   }

// // To enable foreign key in sqflite
//   static Future _onConfigure(Database db) async {
//     await db.execute('PRAGMA foreign_keys = ON');
//   }

//   Future<Database> _initDb() async {
//     Directory dir = await getApplicationDocumentsDirectory();
//     String path = dir.path + 'transaction_list.db';
//     final transactionListDb = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDb,
//       onConfigure: _onConfigure,
//     );
//     return transactionListDb;
//   }

//   void _createDb(Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE $masterLedgerTable($mledgerId INTEGER PRIMARY KEY AUTOINCREMENT, $mledgerName TEXT, $mledgerDescription TEXT)',
//     );

//     await db.execute(
//       'CREATE TABLE $transactionTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colAmount TEXT, $colDate TEXT, $colParticulars TEXT, $colInout TEXT, $colDeptpaid TEXT, $colCashCheaque TEXT, $colStatus INTEGER)',
//     );

//     await db.execute(
//       'CREATE TABLE $transactionTypeTable($typeId INTEGER PRIMARY KEY AUTOINCREMENT, $typeName TEXT, $typeDescription TEXT)',
//     );
//   }

//   Future<List<Map<String, dynamic>>> getTransactionMapList() async {
//     Database db = await this.db;
//     final List<Map<String, dynamic>> result = await db.query(transactionTable);
//     return result;
//   }

//   Future<List<Map<String, dynamic>>> getTransactionTypeMapList() async {

//     Database db = await this.db;
//     final List<Map<String, dynamic>> result =
//         await db.query(transactionTypeTable);
//     return result;
//   }

//   Future<List<Map<String, dynamic>>> getMasterLedgerMapList() async {
//     Database db = await this.db;
//     final List<Map<String, dynamic>> result = await db.query(masterLedgerTable);
//     return result;
//   }

//   Future<List<Transac>> getTransactionList() async {
//     final List<Map<String, dynamic>> transactionMapList =
//         await getTransactionMapList();
//     final List<Transac> transactionList = [];
//     transactionMapList.forEach((transactionMap) {
//       transactionList.add(Transac.fromMap(transactionMap));
//     });
//     transactionList.sort((transactionA, transactionB) =>
//         transactionA.date.compareTo(transactionB.date));
//     return transactionList;
//   }

//   Future<List<Type>> getTransactionTypeList() async {
//     final List<Map<String, dynamic>> transactionTypeMapList =
//         await getTransactionTypeMapList();
//     final List<Type> transactionTypeList = [];
//     transactionTypeMapList.forEach((transactionTypeMap) {
//       transactionTypeList.add(Type.fromMap(transactionTypeMap));
//     });
//     // transactionList.sort((transactionA, transactionB) => transactionA.date.compareTo(transactionB.date));
//     return transactionTypeList;
//   }

//   Future<List<Mledger>> getMasterLedgerList() async {
//     final List<Map<String, dynamic>> masterLedgerMapList =
//         await getMasterLedgerMapList();
//     final List<Mledger> masterLedgerList = [];
//     masterLedgerMapList.forEach(
//       (masterLedgerMap) {
//         masterLedgerList.add(
//           Mledger.fromMap(masterLedgerMap),
//         );
//       },
//     );
//     // transactionList.sort((transactionA, transactionB) => transactionA.date.compareTo(transactionB.date));
//     return masterLedgerList;
//   }

//   Future<int> insertTransaction(Transac transac) async {
//     Database db = await this.db;
//     final int result = await db.insert(transactionTable, transac.toMap());
//     return result;
//   }

//   Future<int> insertTransactionType(Type type) async {
//     Database db = await this.db;
//     final int result = await db.insert(transactionTypeTable, type.toMap());
//     return result;
//   }

//   Future<int> insertMasterLedger(Mledger mledger) async {
//     Database db = await this.db;
//     final int result = await db.insert(masterLedgerTable, mledger.toMap());
//     return result;
//   }

//   Future<int> updateTransaction(Transac transac) async {
//     Database db = await this.db;
//     final int result = await db.update(
//       transactionTable,
//       transac.toMap(),
//       where: '$colId = ?',
//       whereArgs: [transac.id],
//     );
//     return result;
//   }

//   Future<int> updateTransactionType(Type type) async {
//     Database db = await this.db;
//     final int result = await db.update(
//       transactionTypeTable,
//       type.toMap(),
//       where: '$typeId = ?',
//       whereArgs: [type.id],
//     );
//     return result;
//   }

//   Future<int> updateMasterLedger(Mledger mledger) async {
//     Database db = await this.db;
//     final int result = await db.update(
//       masterLedgerTable,
//       mledger.toMap(),
//       where: '$mledgerId = ?',
//       whereArgs: [mledger.id],
//     );
//     return result;
//   }

//   Future<int> deleteTransaction(int id) async {
//     Database db = await this.db;
//     final int result = await db.delete(
//       transactionTable,
//       where: '$colId = ?',
//       whereArgs: [id],
//     );
//     return result;
//   }

//   Future<int> deleteTransactionType(int id) async {
//     Database db = await this.db;
//     final int result = await db.delete(
//       transactionTypeTable,
//       where: '$typeId = ?',
//       whereArgs: [id],
//     );
//     return result;
//   }

//   Future<int> deleteMasterLedger(int id) async {
//     Database db = await this.db;
//     final int result = await db.delete(
//       masterLedgerTable,
//       where: '$mledgerId = ?',
//       whereArgs: [id],
//     );
//     return result;
//   }
// }
