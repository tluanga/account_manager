import 'dart:io';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../static/constants.dart';

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
  String comCountry = 'country';
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
  String mledgerAsset = 'asset';
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
  String transactionTypePartyLedger = 'partyLedger';

  //------TABLE 5 TRANSACTION TABLE ---------------
  String transactionTable = 'transaction_table';
  String transactionId = 'id';
  String transactionAmount = 'amount';
  String transactionParticular = 'particular';
  String transactionIsCredit = 'isCredit';
  String transactionCashOrBank = 'cashOrBank';
  String transactionDate = 'date';
  String transactionCreditType = 'creditType';
  String transactionPartyId = 'partyId';
  String transactionPartyName = 'partyName';
  String transactionassetLedger = 'assetLedger';
  String transactionassetLedgerName = 'assetLedgerName';
  String transactionTransactionTypeId = 'transactionTypeId';
  String transactionTransactionTypeName = 'transactionTypeName';
  String transactionDebitSideLedgerId = 'debitSideLedgerId';
  String transactionDebitSideLedgerName = 'debitSideLedgerName';
  String transactionCreditSideLedgerId = 'creditSideLedgerId';
  String transactionCreditSideLedgerName = 'creditSideLedgerName';
  String transactionideLedgerName = 'creditSideLedgerName';
  String transactionIsReturn = 'isReturn';

  //------TABLE 6 LEDGER TRANSACTION TABLE---------
  String ledgerTransactionTable = 'ledgerTranction_table';
  String ledgerTransactionId = 'id';
  String ledgerTransactionLedgerId = 'ledgerId';
  String ledgerTransactionDate = 'date';
  String ledgerTransactionAmount = 'amount';
  String ledgerTransactionParticular = 'particular';
  String ledgerTransactionDebitOrCredit = 'debitOrCredit';
  String ledgerTransactionCashOrBank = 'cashOrBank';
  String ledgerTransactionIsReturn = 'isReturn';
  String ledgerTransactionTransactionTypeId = 'transactionTypeId';

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
      'CREATE TABLE $companyProfileTable($comId INTEGER PRIMARY KEY AUTOINCREMENT, $comName TEXT, $comAddress TEXT, $comCity TEXT, $comState TEXT, $comCountry TEXT,$comEmail TEXT,$comGsttin TEXT, $comPhoneNumber INT )',
    );
    // Table 2- Accounting Year
    await db.execute(
      'CREATE TABLE $accountingYearTable($accountingYearId INTEGER PRIMARY KEY AUTOINCREMENT, $accountingYearStartDate INT, $accountingYearEndDate INT)',
    );
    // Table 3 - LedgerMaster Table
    await db.execute(
      'CREATE TABLE $masterLedgerTable($mledgerId INTEGER PRIMARY KEY AUTOINCREMENT, $mledgerName TEXT, $mledgerDescription TEXT,$mledgerDirectOrIndirect INT,$mledgerParty INT,$mledgerAsset INT  )',
    );
    // Table 4 - TransactionType Table
    await db.execute(
      'CREATE TABLE $transactionTypeTable($transactionTypeId INTEGER PRIMARY KEY AUTOINCREMENT, $transactionTypeName TEXT, $transactionTypeDescription TEXT, $transactionTypesumChetVelDanType INT,$transactionTypedebitSideLedger INT,$transactionTypecreditSideLedger INT,$transactionTypePartyLedger INT)',
    );
    // Table 5 - Transaction Table
    await db.execute(
      'CREATE TABLE $transactionTable($transactionId INTEGER PRIMARY KEY AUTOINCREMENT, $transactionAmount INT,$transactionParticular TEXT,$transactionIsCredit INT,$transactionCashOrBank INT, $transactionDate INT, $transactionCreditType INT, $transactionPartyId INT, $transactionPartyName TEXT,$transactionassetLedger INTEGER,$transactionassetLedgerName TEXT,$transactionTransactionTypeId INT,$transactionTransactionTypeName TEXT,$transactionDebitSideLedgerId INT,$transactionDebitSideLedgerName TEXT,$transactionCreditSideLedgerId INT,$transactionCreditSideLedgerName TEXT,$ledgerTransactionIsReturn INT  )',
    );
    // Table 6 - Ledger Transaction Table
    await db.execute(
      'CREATE TABLE $ledgerTransactionTable($ledgerTransactionId INTEGER PRIMARY KEY AUTOINCREMENT, $ledgerTransactionLedgerId INT, $transactionDate INT, $ledgerTransactionAmount INT, $ledgerTransactionParticular TEXT, $ledgerTransactionDebitOrCredit INTEGER,$ledgerTransactionCashOrBank INTEGER,$transactionIsReturn INT,$ledgerTransactionTransactionTypeId INT)',
    );

    // Table 7 - Authenticaion PIN
    await db.execute(
      'CREATE TABLE $partyTable($partyId INTEGER PRIMARY KEY AUTOINCREMENT, $partyName TEXT, $partyDescription STRING)',
    );

    // --------Special Ledger------------
    // 1) Bank Ledger
    await db.insert(masterLedgerTable, {
      'name': 'Bank',
      'description': 'All Transaction Involving Bank',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    //2) Cash Account
    await db.insert(masterLedgerTable, {
      'name': 'Cash A/c',
      'description': 'All Transaction Involving Cash',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    //3) Purchase Account
    await db.insert(masterLedgerTable, {
      'name': 'Purchase',
      'description':
          'All Transaction Involving Purchase of Item for resell or raw materia',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 4) Discount Account
    await db.insert(masterLedgerTable, {
      'name': 'Discount',
      'description': 'All Transaction with Discount',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 5) Goods Account
    await db.insert(masterLedgerTable, {
      'name': 'Goods',
      'description': 'Goods Account',
      'directOrIndirect': 1,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // --------------Direct expenses----------------------------------------
    // 6) Wages
    await db.insert(masterLedgerTable, {
      'name': 'Wages',
      'description': 'Wages of Employee',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 7) payment
    await db.insert(masterLedgerTable, {
      'name': 'Payment',
      'description': 'payment account',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 8) Receipt
    await db.insert(masterLedgerTable, {
      'name': 'Receipt',
      'description': 'receipt account',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 9) Carriage
    await db.insert(masterLedgerTable, {
      'name': 'Carriage expenses',
      'description': 'Carriage expenses',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 10) custom duty
    await db.insert(masterLedgerTable, {
      'name': 'Custom duty',
      'description': 'custom duty',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 11) water bill
    await db.insert(masterLedgerTable, {
      'name': 'Water Bill',
      'description': 'water bill',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 12) fuel
    await db.insert(masterLedgerTable, {
      'name': 'Fuel',
      'description': 'fuel',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 13) electric bill
    await db.insert(masterLedgerTable, {
      'name': 'Electric bill',
      'description': 'Electric bill',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 14) Consumable
    await db.insert(masterLedgerTable, {
      'name': 'Consumable',
      'description': 'consumable',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 15) packing
    await db.insert(masterLedgerTable, {
      'name': 'Packing',
      'description': 'packing account',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 16) royalty
    await db.insert(masterLedgerTable, {
      'name': 'Royalty',
      'description': 'royalty account',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });

    //------------------Indirect Expenses----------------------------

    // 17) Salaries
    await db.insert(masterLedgerTable, {
      'name': 'Salaries',
      'description': 'Salaries of Employee',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 18) Rent
    await db.insert(masterLedgerTable, {
      'name': 'Rent',
      'description': 'Rent paid',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 19) Furniture
    await db.insert(masterLedgerTable, {
      'name': 'Furniture',
      'description': 'Transactions made for the purchase of Furnitures',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 20) Water Bill
    await db.insert(masterLedgerTable, {
      'name': 'Water Bill',
      'description': 'Payment of Water bill',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 21) Tax
    await db.insert(masterLedgerTable, {
      'name': 'Tax',
      'description': 'Payment of Tax',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 22) Office Expenses
    await db.insert(masterLedgerTable, {
      'name': 'Office Expenses',
      'description': 'Office Expenses',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 23) Sundry
    await db.insert(masterLedgerTable, {
      'name': 'Sundry Expenses',
      'description': 'Sundry Expenses',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 24) Printing & Stiationery
    await db.insert(masterLedgerTable, {
      'name': 'Printing & Stationery',
      'description': 'printing and Stationery',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 25) Telephone Charges
    await db.insert(masterLedgerTable, {
      'name': 'Telephone Charges',
      'description': 'Telephone bills and charges',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 26) Staff welfare expenses
    await db.insert(masterLedgerTable, {
      'name': 'Staff welfare expenses',
      'description': 'staff welfare expenses',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET,
    });
    // 27) Establishment
    await db.insert(masterLedgerTable, {
      'name': 'Establishment Expenses',
      'description': 'Establishment Expenses',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 28) Internet bill
    await db.insert(masterLedgerTable, {
      'name': 'Internet Bill',
      'description': 'internet bill',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 29) courier charge
    await db.insert(masterLedgerTable, {
      'name': 'Courier Charge',
      'description': 'courier charges',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 30) Distribution expenses
    await db.insert(masterLedgerTable, {
      'name': 'Distribution Expenses',
      'description': 'distribution expenses account',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 31) Travelling
    await db.insert(masterLedgerTable, {
      'name': 'Travelling Expenses',
      'description': 'transactions involving travelling',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 32) Freight outward
    await db.insert(masterLedgerTable, {
      'name': 'Freight Outward',
      'description': 'Freight outward account',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 33) Audit fee
    await db.insert(masterLedgerTable, {
      'name': 'Audit Fee',
      'description': 'fees for auditing',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 34) Bad debts
    await db.insert(masterLedgerTable, {
      'name': 'Bad Debts',
      'description': 'Debts which are estimated to be uncollectible',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 35) Provision for bad debts
    await db.insert(masterLedgerTable, {
      'name': 'Provision for bad debts',
      'description': 'acoount to make solution for bad debts',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 36) Advertisement
    await db.insert(masterLedgerTable, {
      'name': 'Advertisement',
      'description': 'money use for advertisement',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 37) Charity/Donation
    await db.insert(masterLedgerTable, {
      'name': 'Charity/Donation',
      'description': 'Transactions made for Charity and/or Donations',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 38) Depreciation
    await db.insert(masterLedgerTable, {
      'name': 'Depreciation',
      'description': 'depreciation account',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 39) Bank charges
    await db.insert(masterLedgerTable, {
      'name': 'Bank Charges',
      'description': 'charges made by the bank to us',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 40) Administrative Expenses
    await db.insert(masterLedgerTable, {
      'name': 'Administrative Expenses',
      'description': 'expenses for the cause of administrations',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 41) Commission
    await db.insert(masterLedgerTable, {
      'name': 'Commission',
      'description': 'commission account',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 42) Sample
    await db.insert(masterLedgerTable, {
      'name': 'Sample Expenses',
      'description': 'Sample Expenses',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 43) Liscense fee
    await db.insert(masterLedgerTable, {
      'name': 'Liscense Fee',
      'description': 'fees paid for liscense',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 44) Delivery Charges
    await db.insert(masterLedgerTable, {
      'name': 'Delivery Charges',
      'description': 'delivery charges',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 45) Sales tax paid
    await db.insert(masterLedgerTable, {
      'name': 'Sales tax paid',
      'description': 'Sales tax paid',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 46) Loss on sale of assets
    await db.insert(masterLedgerTable, {
      'name': 'Loss on sale of assets',
      'description': 'loss on sale of assets',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 47) Loss by fire/theft
    await db.insert(masterLedgerTable, {
      'name': 'Loss by fire/theft',
      'description': 'loss by fire/theft',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 48) repairs/ renewal/ maintenance
    await db.insert(masterLedgerTable, {
      'name': 'Repair/Renewal/Maintenance A/c',
      'description': 'account for repair, renewal and maintenance',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 49) Legal charges
    await db.insert(masterLedgerTable, {
      'name': 'Legal Charges',
      'description': 'legal charges',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    // 50) insurance
    await db.insert(masterLedgerTable, {
      'name': 'Insurance',
      'description': 'insurance account',
      'directOrIndirect': cIndirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });
    //--------------Sales and Incomes-----------------
    // 51) Sales
    await db.insert(masterLedgerTable, {
      'name': 'Sales',
      'description': 'Sales account excluding sale returns',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cNonASSET
    });

    // -----------Mock Data----------
    // 1)LedgerTransaction
    await db.insert(ledgerTransactionTable, {
      'ledgerId': 1,
      'date': 1611744439,
      'amount': 1000,
      'particular': 'Purchase of Raw Material',
      'debitOrCredit': 1,
      'cashOrBank': 1,
    });
    //53
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
    //1
    await db.insert(transactionTypeTable, {
      'name': 'Purchase of Material',
      'description': 'Purchase of Material for Resell or for Production',
      'sumChetVelDanType': 0,
      'debitSideLedger': LedgerID.PURCHASEAC,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //2
    await db.insert(transactionTypeTable, {
      'name': 'Purchase of Assets',
      'description':
          'Purchase of Material for Business, not for Resell or Raw Material',
      'sumChetVelDanType': 0,
      'debitSideLedger': 3,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //3
    await db.insert(transactionTypeTable, {
      'name': 'Sale of Goods',
      'description': 'Sales of Goods which are not manufactured',
      'sumChetVelDanType': 1,
      'debitSideLedger': 3,
      'creditSideLedger': 2,
      'partyLedger': 0,
    });
    //5
    await db.insert(transactionTypeTable, {
      'name': 'Wages',
      'description': 'Hnathawkte hlawh',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.WAGES,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //5
    await db.insert(transactionTypeTable, {
      'name': 'Carriage expenses',
      'description': 'Bungraw phur kualnaa sum hman',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.CARRIAGE,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //6
    await db.insert(transactionTypeTable, {
      'name': 'Manufacturing expenses',
      'description': 'bungraw lakkhawmna',
      'sumChetVelDanType': 0,
      'debitSideLedger': 3, //MANUFACTURING LEDGER A LA AWM LO
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //7
    await db.insert(transactionTypeTable, {
      'name': 'Packing expenses',
      'description': 'bungraw pack na',
      'sumChetVelDanType': 0,
      'debitSideLedger': LedgerID.PACKING,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //8
    await db.insert(transactionTypeTable, {
      'name': 'Salaries ',
      'description': 'hnathawkate thla tin hlawh',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.SALARIES,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //9
    await db.insert(transactionTypeTable, {
      'name': 'Office rent',
      'description': 'office luahna man',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.OFFICE_EXPENSES,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //10
    await db.insert(transactionTypeTable, {
      'name': 'Printing & Stationery',
      'description': 'Lehkha print na,etc. leh Stationary a sum hman te',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.PRINTING_AND_STATIONERY,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //11
    await db.insert(transactionTypeTable, {
      'name': 'Telephone Charges',
      'description': 'bungraw pack na',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.TELEPHONE_CHARGES,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //12
    await db.insert(transactionTypeTable, {
      'name': 'Postage and telegram',
      'description': 'postage and telegram',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.PRINTING_AND_STATIONERY,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //13
    await db.insert(transactionTypeTable, {
      'name': 'Insurance',
      'description': 'Insurance',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.INSURANCE,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //14
    await db.insert(transactionTypeTable, {
      'name': 'Audit fees',
      'description': 'audit fee',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.AUDIT_FEE,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //15
    await db.insert(transactionTypeTable, {
      'name': 'Electricity',
      'description': 'Electric bill leh electric lama sum hmanna te',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.ELECTRIC_BILL,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //16
    await db.insert(transactionTypeTable, {
      'name': 'Repairs and renewal',
      'description': 'Thil siam thatnaa sum hman te',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.REPAIRS_RENEWAL_MAINTENANCE,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //17
    await db.insert(transactionTypeTable, {
      'name': 'Advertisement',
      'description': 'advertisement',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.ADVERTISEMENT,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //18
    await db.insert(transactionTypeTable, {
      'name': 'Discount',
      'description': 'Discount kan pek na',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.DISCOUNTAC,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //19
    await db.insert(transactionTypeTable, {
      'name': 'Depreciation',
      'description': 'Thil man a ai tlawma kan pekna zat',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.DEPRECIATIONAC,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //20
    await db.insert(transactionTypeTable, {
      'name': 'Carriage outward',
      'description': 'Carriage outward',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.CARRIAGE,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //21
    await db.insert(transactionTypeTable, {
      'name': 'Bad debts',
      'description': 'Ba min pek tawh loh tur te',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.BAD_DEBTS,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //22
    await db.insert(transactionTypeTable, {
      'name': 'Provision for bad debts',
      'description': 'bat ral te phuhrukna tur',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.PROVISION_FOR_BAD_DEBTS,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //23
    await db.insert(transactionTypeTable, {
      'name': 'Selling commission',
      'description': 'Selling commission',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.COMMISSION,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //24
    await db.insert(transactionTypeTable, {
      'name': 'Bank charges',
      'description': 'bank charges',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.BANK_CHARGES,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });
    //25
    await db.insert(transactionTypeTable, {
      'name': 'Loss on sale of asset',
      'description': 'bungraw hralhchhawnna a pawisa hloh na',
      'sumChetVelDanType': 3,
      'debitSideLedger': LedgerID.LOSS_ON_SALE_OF_ASSETS,
      'creditSideLedger': LedgerID.CASHAC,
      'partyLedger': 0,
    });

    ///////////////////////////////////////////////////////////////////

    //26
    await db.insert(transactionTypeTable, {
      'name': 'Discount Recieved',
      'description': 'thil leina a discount kan dawn zat',
      'sumChetVelDanType': 2,
      'debitSideLedger': LedgerID.CASHAC,
      'creditSideLedger': LedgerID.DISCOUNTAC,
      'partyLedger': 0,
    });
    //27
    await db.insert(transactionTypeTable, {
      'name': 'Commission recieved',
      'description': 'commission na a hmuh zat',
      'sumChetVelDanType': 2,
      'debitSideLedger': LedgerID.CASHAC,
      'creditSideLedger': LedgerID.COMMISSION,
      'partyLedger': 0,
    });
    //28
    await db.insert(transactionTypeTable, {
      'name': 'Bank interest',
      'description': 'bank interest dawn zat',
      'sumChetVelDanType': 2,
      'debitSideLedger': LedgerID.BANK,
      'creditSideLedger': 2, // la ngaihtuah tur
      'partyLedger': 0,
    });
    //29
    await db.insert(transactionTypeTable, {
      'name': 'Rent recieved',
      'description': 'Kan in/dawr luahman atanga sum dawn',
      'sumChetVelDanType': 2,
      'debitSideLedger': LedgerID.CASHAC,
      'creditSideLedger': LedgerID.RENT,
      'partyLedger': 0,
    });
    //30
    await db.insert(transactionTypeTable, {
      'name': 'Profit on sale of asset',
      'description': 'Bungraw hralhchhawnna atanga hlawkna',
      'sumChetVelDanType': 2,
      'debitSideLedger': LedgerID.CASHAC,
      'creditSideLedger':
          2, // profit on sale of asset ledger siam a ngai a ngem??
      'partyLedger': 0,
    });

    //--------Mock Data -- LedgerMaster Party-------------------
    //52
    await db.insert(masterLedgerTable, {
      'name': 'Alex Telles',
      'description': 'Aizawl',
      'directOrIndirect': cDirectAc,
      'party': cPartyAc,
      'asset': cNonASSET
    });
    //53
    await db.insert(masterLedgerTable, {
      'name': 'William Defoe',
      'description': 'Kan Hmun',
      'directOrIndirect': cDirectAc,
      'party': cPartyAc,
      'asset': cNonASSET
    });
    //54
    await db.insert(masterLedgerTable, {
      'name': 'Rema ',
      'description': 'Zohmun',
      'directOrIndirect': cDirectAc,
      'party': cPartyAc,
      'asset': cNonASSET
    });
    //55
    await db.insert(masterLedgerTable, {
      'name': 'Zomawia ',
      'description': 'Aizawl',
      'directOrIndirect': cDirectAc,
      'party': cPartyAc,
      'asset': cNonASSET
    });
    //56
    await db.insert(masterLedgerTable, {
      'name': 'Zasiama ',
      'description': 'Lunglei',
      'directOrIndirect': cDirectAc,
      'party': cPartyAc,
      'asset': cNonASSET
    });
    //57
    await db.insert(masterLedgerTable, {
      'name': 'Rotluanga ',
      'description': 'Thingkawrdeng',
      'directOrIndirect': cDirectAc,
      'party': cPartyAc,
      'asset': cNonASSET
    });

    //-----------------MockData for Asset Item----------
    //58
    await db.insert(masterLedgerTable, {
      'name': 'Chair ',
      'description': 'Chair',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cASSET
    });
    //59
    await db.insert(masterLedgerTable, {
      'name': 'Machinery ',
      'description': 'Machiner',
      'directOrIndirect': cDirectAc,
      'party': cNotPartyAc,
      'asset': cASSET
    });
  }
}
