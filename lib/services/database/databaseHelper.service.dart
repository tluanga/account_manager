import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  static const String transactionTable = 'transaction_table';
  String transactionTypeTable = 'transactionType_table';
  static const String masterLedgerTable = 'masterLedger_table';
  static const String companyProfileTable = 'companyProfile_table';

  //transactionTable
  String colId = 'id';
  String colAmount = 'amount';
  //String colDate = 'date';
  String colParticulars = 'particulars';
  String colTransactionTypeId = 'transactionTypeId';
  String colBaOrPektlak = 'baOrPektlak';
  String colCashOrBank = 'cashOrBank';

  //typeTable
  String typeId = 'id';
  String typeName = 'name';
  String typeDescription = 'description';

  //MasterLedgeTable
  String mledgerId = 'id';
  String mledgerName = 'name';
  String mledgerDescription = 'description';

  // CompanyProfileTable
  String comId = 'id';
  String comName = 'name';
  String comAddress = 'address';
  String comCity = 'city';
  String comState = 'state';
  String comCountry = 'Country';
  String comEmail = 'email';
  String comGsttin = 'gstTin';
  String comPhoneNumber = 'phoneNumber';

  // Task Tables
  // Id | Title | Date | Priority | Status
  // 0     ''      ''       ''       0or1

  Future<Database> get db async {
    if (_db == null) {
      print('null');
      _db = await _initDb();
    }
    print(_db.toString());
    return _db;
  }

// To enable foreign key in sqflite
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDb() async {
    print('inside initiDb');
    Directory dir = await getApplicationDocumentsDirectory();
    print('database location :' + dir.path);

    String path = dir.path + '/account_manager.db';
    print('path is $path');
    final accountManagerDb = await openDatabase(
      path,
      version: 2,
      onCreate: _createDb,
      onConfigure: _onConfigure,
    );
    return accountManagerDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $masterLedgerTable($mledgerId INTEGER PRIMARY KEY AUTOINCREMENT, $mledgerName TEXT, $mledgerDescription TEXT)',
    );

    await db.execute(
      'CREATE TABLE $transactionTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colAmount TEXT, $colParticulars TEXT, $colTransactionTypeId INTEGER, $colBaOrPektlak INTEGER, $colCashOrBank INTEGER)',
    );

    // await db.execute(
    //   'CREATE TABLE $transactionTypeTable($typeId INTEGER PRIMARY KEY AUTOINCREMENT, $typeName TEXT, $typeDescription TEXT)',
    // );
  }
}
