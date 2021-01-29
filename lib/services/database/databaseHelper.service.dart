import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  // ------TABLE -1-COMPANY PROFILE TABLE------------
  static const String companyProfileTable = 'companyProfile_table';
  String comId = 'id';
  String comName = 'name';
  String comAddress = 'address';
  String comCity = 'city';
  String comState = 'state';
  String comCountry = 'Country';
  String comEmail = 'email';
  String comGsttin = 'gstTin';
  String comPhoneNumber = 'phoneNumber';

  // -----TABLE -2 ACCOUNTING YEAR TABLE----------
  static const String accountingYearTable = 'accountingYear_table';
  String accountingYearId = 'id';
  String accountingYearStartDate = 'startDate';
  String accountingYearEndDate = 'endDate';

  // -------TABLE -3 LEDGER MASTER TABLE----------
  static const String masterLedgerTable = 'masterLedger_table';
  String mledgerId = 'id';
  String mledgerName = 'name';
  String mledgerDescription = 'description';
  String mledgerDirectOrIndirect = 'directOrIndirect';
  String mledgerParty = 'party';

  // -----TABLE 4-TRANSACTION TYPE TABLE-----------
  String transactionTypeTable = 'transactionType_table';
  String transactionTypeId = 'id';
  String transactionTypeName = 'name';
  String transactionTypeDescription = 'description';
  String transactionTypesumChetVelDanType = 'sumChetVelDanType';
  String transactionTypedebitSideLedger = 'debitSideLedger';
  String transactionTypecreditSideLedger = 'creditSideLedger';

  //------TABLE 5 TRANSACTION TABLE ---------------
  String transactionTable = 'transaction_table';
  String transactionId = 'id';
  String transactionAmount = 'amount';
  String transactionDate = 'date';
  String transactionParticular = 'particular';
  String transactionTransactionTypeId = 'transactionTypeId';
  String transactionBaOrBalo = 'baOrBalo';
  String transactionCashOrBank = 'cashOrBank';

  //------TABLE 6 LEDGER TRANSACTION TABLE---------
  String ledgerTransactionTable = 'ledgerTranction_table';
  String ledgerTransactionId = 'id';
  String ledgerTransactionLedgerId = 'ledgerId';
  String ledgerTransactionDate = 'date';
  String ledgerTransactionAmount = 'amount';
  String ledgerTransactionParticular = 'particular';
  String ledgerTransactionDebitOrCredit = 'debitOrCredit';
  String ledgerTransactionCashOrBank = 'cashOrBank';

  //------TABLE 7 PARTY TABLE
  String partyTable = 'party_table';
  String partyId = 'id';
  String partyName = 'name';
  String partyDescription = 'description';

  //------TABLE 8 AUTHENTICATION PIN

  Future<Database> get db async {
    if (_db == null) {
      // print('null');
      _db = await _initDb();
    }

    return _db;
  }

// To enable foreign key in sqflite
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();

    String path = dir.path + '/account_manager.db';

    final accountManagerDb = await openDatabase(
      path,
      version: 2,
      onCreate: _createDb,
      onConfigure: _onConfigure,
    );
    return accountManagerDb;
  }

  void _createDb(Database db, int version) async {
    // Table 1- Company Profile
    await db.execute(
      'CREATE TABLE $companyProfileTable($comId INTEGER PRIMARY KEY AUTOINCREMENT, $comName TEXT, $mledgerDescription TEXT)',
    );
    // Table 2- Accounting Year
    await db.execute(
      'CREATE TABLE $accountingYearTable($accountingYearId INTEGER PRIMARY KEY AUTOINCREMENT, $accountingYearStartDate INT, $accountingYearEndDate INT)',
    );
    // Table 3 - LedgerMaster Table
    await db.execute(
      'CREATE TABLE $masterLedgerTable($mledgerId INTEGER PRIMARY KEY AUTOINCREMENT, $mledgerName TEXT, $mledgerDescription TEXT,$mledgerDirectOrIndirect INT,$mledgerParty INT )',
    );
    // Table 4 - TransactionType Table
    await db.execute(
      'CREATE TABLE $transactionTypeTable($transactionTypeId INTEGER PRIMARY KEY AUTOINCREMENT, $transactionTypeName TEXT, $transactionTypeDescription TEXT, $transactionTypesumChetVelDanType INT,$transactionTypedebitSideLedger INT,$transactionTypecreditSideLedger INT)',
    );
    // Table 5 - Transaction Table
    await db.execute(
      'CREATE TABLE $transactionTable($transactionId INTEGER PRIMARY KEY AUTOINCREMENT, $transactionAmount INT, $transactionDate INT, $transactionParticular TEXT, $transactionTransactionTypeId INTEGER, $transactionBaOrBalo INTEGER,$transactionCashOrBank INTEGER)',
    );
    // Table 6 - Ledger Transaction Table
    await db.execute(
      'CREATE TABLE $ledgerTransactionTable($ledgerTransactionId INTEGER PRIMARY KEY AUTOINCREMENT, $ledgerTransactionLedgerId INT, $transactionDate INT, $ledgerTransactionAmount INT, $ledgerTransactionParticular TEXT, $ledgerTransactionDebitOrCredit INTEGER,$ledgerTransactionCashOrBank INTEGER)',
    );

    // Table 7 - Authenticaion PIN
    await db.execute(
      'CREATE TABLE $partyTable($partyId INTEGER PRIMARY KEY AUTOINCREMENT, $partyName TEXT, $partyDescription STRING)',
    );

    // --------Special Ledger------------
    // 1) Bank Ledger
    await db.insert(masterLedgerTable,
        {'name': 'Bank', 'description': 'All Transaction Involving Bank'});
    //2) Cash Account
    await db.insert(masterLedgerTable, {
      'name': 'Cash A/c',
      'description': 'All Transaction Involving Cash',
      'directOrIndirect': 0,
      'party': 0
    });
    //3) Purchase Account
    await db.insert(masterLedgerTable, {
      'name': 'Purchase',
      'description':
          'All Transaction Involving Purchase of Item for resell or raw materia',
      'directOrIndirect': 0,
      'party': 0,
    });
    // 4) Discount Account
    await db.insert(masterLedgerTable, {
      'name': 'Discount',
      'description': 'All Transaction with Discount',
      'directOrIndirect': 0,
      'party': 0,
    });
    // 5) Goods Account
    await db.insert(masterLedgerTable, {
      'name': 'Goods',
      'description': 'Goods Account',
      'directOrIntdirect': 0,
      'party': 0
    });
    // 6) Wages
    await db.insert(masterLedgerTable, {
      'name': 'Wages',
      'description': 'Wages of Employee',
      'directOrIndirect': 0,
      'party': 0
    });
    // -----------Mock Data----------
    // 7)LedgerTransaction
    await db.insert(ledgerTransactionTable, {
      'ledgerId': 1,
      'date': 1611744439,
      'amount': 1000,
      'particular': 'Purchase of Raw Material',
      'debitOrCredit': 1,
      'cashOrBank': 1,
    });
    await db.insert(ledgerTransactionTable, {
      'ledgerId': 1,
      'date': 1611744450,
      'amount': 3000,
      'particular': 'Purchase of Raw Material',
      'debitOrCredit': 1,
      'cashOrBank': 1,
    });

    //--------Special Transaction Type--------------
    // 1---Purchase of Material for Resell or for Production
    await db.insert(transactionTypeTable, {
      'name': 'Purchase of Material',
      'description': 'Purchase of Material for Resell or for Production',
      'sumChetVelDanType': 1,
      'debitSideLedger': 3,
      'creditSideLedger': 2
    });
    await db.insert(transactionTypeTable, {
      'name': 'Purchase of Assets',
      'description':
          'Purchase of Material for Business, not for Resell or Raw Material',
      'sumChetVelDanType': 1,
      'debitSideLedger': 3,
      'creditSideLedger': 2
    });
  }
}
