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
      'directOrIndirect': 1,
      'party': 0,
    });
    // 5) Goods Account
    await db.insert(masterLedgerTable, {
      'name': 'Goods',
      'description': 'Goods Account',
      'directOrIndirect': 1,
      'party': 0
    });
    // --------------Direct expenses----------------------------------------
    // 6) Wages
    await db.insert(masterLedgerTable, {
      'name': 'Wages',
      'description': 'Wages of Employee',
      'directOrIndirect': 0,
      'party': 0
    });
    // 7) payment
    await db.insert(masterLedgerTable, {
      'name': 'Payment',
      'description': 'payment account',
      'directOrIndirect': 0,
      'party': 0
    });
    // 8) Receipt
    await db.insert(masterLedgerTable, {
      'name': 'Receipt',
      'description': 'receipt account',
      'directOrIndirect': 0,
      'party': 0
    });
    // 9) Carriage
    await db.insert(masterLedgerTable, {
      'name': 'Carriage expenses',
      'description': 'Carriage expenses',
      'directOrIndirect': 0,
      'party': 0
    });
    // 10) custom duty
    await db.insert(masterLedgerTable, {
      'name': 'Custom duty',
      'description': 'custom duty',
      'directOrIndirect': 0,
      'party': 0
    });
    // 11) water bill
    await db.insert(masterLedgerTable, {
      'name': 'Water Bill',
      'description': 'water bill',
      'directOrIndirect': 0,
      'party': 0
    });
    // 12) fuel
    await db.insert(masterLedgerTable, {
      'name': 'Fuel',
      'description': 'fuel',
      'directOrIndirect': 0,
      'party': 0
    });
    // 13) electric bill
    await db.insert(masterLedgerTable, {
      'name': 'Electric bill',
      'description': 'Electric bill',
      'directOrIndirect': 0,
      'party': 0
    });
    // 14) Consumable
    await db.insert(masterLedgerTable, {
      'name': 'Consumable',
      'description': 'consumable',
      'directOrIndirect': 0,
      'party': 0
    });
    // 15) packing
    await db.insert(masterLedgerTable, {
      'name': 'Packing',
      'description': 'packing account',
      'directOrIndirect': 0,
      'party': 0
    });
    // 16) royalty
    await db.insert(masterLedgerTable, {
      'name': 'Royalty',
      'description': 'royalty account',
      'directOrIndirect': 0,
      'party': 0
    });

    //------------------Indirect Expenses----------------------------

    // 17) Salaries
    await db.insert(masterLedgerTable, {
      'name': 'Salaries',
      'description': 'Salaries of Employee',
      'directOrIndirect': 1,
      'party': 0
    });
    // 18) Rent
    await db.insert(masterLedgerTable, {
      'name': 'Rent',
      'description': 'Rent paid',
      'directOrIndirect': 1,
      'party': 0
    });
    // 19) Furniture
    await db.insert(masterLedgerTable, {
      'name': 'Furniture',
      'description': 'Transactions made for the purchase of Furnitures',
      'directOrIndirect': 1,
      'party': 0
    });
    // 20) Water Bill
    await db.insert(masterLedgerTable, {
      'name': 'Water Bill',
      'description': 'Payment of Water bill',
      'directOrIndirect': 1,
      'party': 0
    });
    // 21) Tax
    await db.insert(masterLedgerTable, {
      'name': 'Tax',
      'description': 'Payment of Tax',
      'directOrIndirect': 1,
      'party': 0
    });
    // 22) Office Expenses
    await db.insert(masterLedgerTable, {
      'name': 'Office Expenses',
      'description': 'Office Expenses',
      'directOrIndirect': 1,
      'party': 0
    });
    // 23) Sundry
    await db.insert(masterLedgerTable, {
      'name': 'Sundry Expenses',
      'description': 'Sundry Expenses',
      'directOrIndirect': 1,
      'party': 0
    });
    // 24) Printing & Stiationery
    await db.insert(masterLedgerTable, {
      'name': 'Printing & Stationery',
      'description': 'printing and Stationery',
      'directOrIndirect': 1,
      'party': 0
    });
    // 25) Telephone Charges
    await db.insert(masterLedgerTable, {
      'name': 'Telephone Charges',
      'description': 'Telephone bills and charges',
      'directOrIndirect': 1,
      'party': 0
    });
    // 26) Staff welfare expenses
    await db.insert(masterLedgerTable, {
      'name': 'Staff welfare expenses',
      'description': 'staff welfare expenses',
      'directOrIndirect': 1,
      'party': 0
    });
    // 27) Establishment
    await db.insert(masterLedgerTable, {
      'name': 'Establishment Expenses',
      'description': 'Establishment Expenses',
      'directOrIndirect': 1,
      'party': 0
    });
    // 28) Internet bill
    await db.insert(masterLedgerTable, {
      'name': 'Internet Bill',
      'description': 'internet bill',
      'directOrIndirect': 1,
      'party': 0
    });
    // 29) courier charge
    await db.insert(masterLedgerTable, {
      'name': 'Courier Charge',
      'description': 'courier charges',
      'directOrIndirect': 1,
      'party': 0
    });
    // 30) Distribution expenses
    await db.insert(masterLedgerTable, {
      'name': 'Distribution Expenses',
      'description': 'distribution expenses account',
      'directOrIndirect': 1,
      'party': 0
    });
    // 31) Travelling
    await db.insert(masterLedgerTable, {
      'name': 'Travelling Expenses',
      'description': 'transactions involving travelling',
      'directOrIndirect': 1,
      'party': 0
    });
    // 32) Freight outward
    await db.insert(masterLedgerTable, {
      'name': 'Freight Outward',
      'description': 'Freight outward account',
      'directOrIndirect': 1,
      'party': 0
    });
    // 33) Audit fee
    await db.insert(masterLedgerTable, {
      'name': 'Audit Fee',
      'description': 'fees for auditing',
      'directOrIndirect': 1,
      'party': 0
    });
    // 34) Bad debts
    await db.insert(masterLedgerTable, {
      'name': 'Bad Debts',
      'description': 'Debts which are estimated to be uncollectible',
      'directOrIndirect': 1,
      'party': 0
    });
    // 35) Provision for bad debts
    await db.insert(masterLedgerTable, {
      'name': 'Provision for bad debts',
      'description': 'acoount to make solution for bad debts',
      'directOrIndirect': 1,
      'party': 0
    });
    // 36) Advertisement
    await db.insert(masterLedgerTable, {
      'name': 'Advertisement',
      'description': 'money use for advertisement',
      'directOrIndirect': 1,
      'party': 0
    });
    // 37) Charity/Donation
    await db.insert(masterLedgerTable, {
      'name': 'Charity/Donation',
      'description': 'Transactions made for Charity and/or Donations',
      'directOrIndirect': 1,
      'party': 0
    });
    // 38) Depreciation
    await db.insert(masterLedgerTable, {
      'name': 'Depreciation',
      'description': 'depreciation account',
      'directOrIndirect': 1,
      'party': 0
    });
    // 39) Bank charges
    await db.insert(masterLedgerTable, {
      'name': 'Bank Charges',
      'description': 'charges made by the bank to us',
      'directOrIndirect': 1,
      'party': 0
    });
    // 40) Administrative Expenses
    await db.insert(masterLedgerTable, {
      'name': 'Administrative Expenses',
      'description': 'expenses for the cause of administrations',
      'directOrIndirect': 1,
      'party': 0
    });
    // 41) Commission
    await db.insert(masterLedgerTable, {
      'name': 'Commission',
      'description': 'commission account',
      'directOrIndirect': 1,
      'party': 0
    });
    // 42) Sample
    await db.insert(masterLedgerTable, {
      'name': 'Sample Expenses',
      'description': 'Sample Expenses',
      'directOrIndirect': 1,
      'party': 0
    });
    // 43) Liscense fee
    await db.insert(masterLedgerTable, {
      'name': 'Liscense Fee',
      'description': 'fees paid for liscense',
      'directOrIndirect': 1,
      'party': 0
    });
    // 44) Delivery Charges
    await db.insert(masterLedgerTable, {
      'name': 'Delivery Charges',
      'description': 'delivery charges',
      'directOrIndirect': 1,
      'party': 0
    });
    // 45) Sales tax paid
    await db.insert(masterLedgerTable, {
      'name': 'Sales tax paid',
      'description': 'Sales tax paid',
      'directOrIndirect': 1,
      'party': 0
    });
    // 46) Loss on sale of assets
    await db.insert(masterLedgerTable, {
      'name': 'Loss on sale of assets',
      'description': 'loss on sale of assets',
      'directOrIndirect': 1,
      'party': 0
    });
    // 47) Loss by fire/theft
    await db.insert(masterLedgerTable, {
      'name': 'Loss by fire/theft',
      'description': 'loss by fire/theft',
      'directOrIndirect': 1,
      'party': 0
    });
    // 48) repairs/ renewal/ maintenance
    await db.insert(masterLedgerTable, {
      'name': 'Repair/Renewal/Maintenance A/c',
      'description': 'account for repair, renewal and maintenance',
      'directOrIndirect': 1,
      'party': 0
    });
    // 49) Legal charges
    await db.insert(masterLedgerTable, {
      'name': 'Legal Charges',
      'description': 'legal charges',
      'directOrIndirect': 1,
      'party': 0
    });
    // 50) insurance
    await db.insert(masterLedgerTable, {
      'name': 'Insurance',
      'description': 'insurance account',
      'directOrIndirect': 1,
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
