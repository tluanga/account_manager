import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/assetMockData.constant.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/partyMock.constant.dart';
import 'package:account_manager/static/purchaseType.constant.dart';
import 'package:account_manager/static/saleType.constant.dart';
import 'package:account_manager/static/transactionType.constant.dart';

import 'package:flutter/foundation.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import '../../../static/constants.dart';

import '../../../static/ledgerId.constants.dart';

import '../../models/ledgerTransaction.model.dart';
import '../../models/ledgermaster.models.dart';
import '../../models/transaction.model.dart';
import '../../models/transactionType.models.dart';

import '../../../services/transaction/transaction.service.dart';

import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';

class NewPurchaseTransactionViewModel extends ChangeNotifier {
  int _amount;
  String _particular; //--user input
  int _isCredit = cCashDown; //user input
  int _cashOrBank = CASH; //user input
  DateTime _date = DateTime.now(); //user input
  int _creditType = cCredit; //BA partial or Full --user input
  int _partyId; //user purchase is made by BA
  String _partyName; //Computed
  int _assetLedger; //if the purchase is of asset//user input
  String _assetLedgerName;
  int _transactionTypeId = 0;
  String _transactionTypeName = ''; //user input
  // ignore: unused_field
  int _debitSideLedgerId = 0; //computed-
  String _debitSideLedgerName; //computed --
//computed --
  // ignore: unused_field
  int _creditSideLedgerId = 0;
  String _creditSideLedgerName; //--computer
  // ignore: unused_field
  int _salesType;
  List<LedgerMaster> partyList = [];

  // ignore: unused_field
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  // ignore: unused_field
  TransactionService _transactionService = serviceLocator<TransactionService>();
  // ignore: unused_field
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  List<TransactionType> transactionTypeList = [];
  void setTransactionTypeList(_searchString) async {
    transactionTypeList =
        await _transactionTypeService.getTransactionTypeList(_searchString);
    print(transactionTypeList.length.toString());
    notifyListeners();
  }

  void newAssetLedger(String _name, String _description) async {
    await _ledgerMasterService.insert(
      LedgerMaster(
          name: _name,
          description: _description,
          directOrIndirect: cDirectAc,
          party: cNotPartyAc,
          asset: cASSET),
    );
  }

  void setPurchaseType() async {
    if (_isCredit == cCashDown) {
      if (_cashOrBank == BANK) {
        //type -1 --saleCashDownBank
        _salesType = SaleType.saleCashDownBank;
      }
      if (_cashOrBank == CASH) {
        //Type-2--saleCashDownCash
        _salesType = SaleType.saleCashDownCash;
      }
    } else if (_isCredit == cCredit) {
      if (_creditType != cPartialCredit) {
        //Type 3-Sales BA
        _salesType = SaleType.saleDebt;
      }
    } else if (_creditType == cPartialCredit) {
      if (_cashOrBank == BANK) {
        //Type 4 Sales Partial BA - Bank
        _salesType = SaleType.saleBaPartialBank;
      } else if (_cashOrBank == CASH) {
        //Type 5 Sales Partial BA - CASH
        _salesType = SaleType.assetBaPartialCash;
      }
    }
  }

  void saveData() {
    _transactionService.insert(
      Transaction(
        amount: _amount,
        particular: _particular,
        isCredit: _isCredit,
        cashOrBank: _cashOrBank,
        date: _date,
        creditType: _creditType,
        partyId: _partyId,
        partyName: _partyName,
        assetLedger: _assetLedger,
        transactionTypeId: _transactionTypeId,
        transactionTypeName: _transactionTypeName,
      ),
    );

    switch (_salesType) {
      case SaleType.saleCashDownBank:
        {
          // --process debit side
          print('type-1:saleCashDownBank');
          _debitSideLedgerId = LedgerID.BANK;
          _creditSideLedgerId = LedgerID.SALESAC;
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
            ),
          );
        }
        break;
      case SaleType.saleCashDownCash:
        {
          print('type-2:saleCashDownCash');
          // --process debit side
          _debitSideLedgerId = LedgerID.CASHAC;
          _creditSideLedgerId = LedgerID.SALESAC;
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
            ),
          );
        }
        break;
      case SaleType.saleDebt:
        // ---Type 3----
        {
          print('type-3:saleDebt');
          _debitSideLedgerId = _partyId;
          _creditSideLedgerId = LedgerID.SALESAC;
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
            ),
          );
        }
        break;
      case SaleType.saleBaPartialBank:
        // ---Type 4----
        {
          print('type-4:saleBaPartialBank');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.BANK,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: _partyId,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: DEBIT,
            cashOrBank: _cashOrBank,
          );
          //process credit side-party ac
          LedgerTransaction(
            ledgerId: LedgerID.SALESAC,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case SaleType.assetBaPartialCash:
        // ---Type 5----
        {
          print('type-5:assetBaPartialCash');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.CASHAC,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: _partyId,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
          //process credit side-party ac
          LedgerTransaction(
            ledgerId: LedgerID.SALESAC,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
    }
  }

  void printData() {
    print('Amount:$_amount');
    print('Particular:$_particular');
    print('Ba or Balo:$_isCredit');
    print('Cash or Bank:$_cashOrBank');
    print('Ba Type:$_creditType');
    print('Party Id:$_partyId');
    print('Party Name :$_partyName');
  }

  void getFilterdPartyLedgerMaster(String _searchString) async {
    List<LedgerMaster> _ledgerMasterList =
        await _ledgerMasterService.getFilterdPartyLedgerList(_searchString);
    print(_searchString);
    String _length = _ledgerMasterList.length.toString();
    partyList = _ledgerMasterList;
    print('The search Returned $_length result in the viewmodel');
    notifyListeners();
  }

  Future<int> newPartyLedger({
    name,
    description,
  }) async {
    var payload = LedgerMaster(
        name: name,
        description: description,
        directOrIndirect: cDirectAc,
        party: cPartyAc,
        asset: cNonASSET);
    var result = await _ledgerMasterService.insert(payload);

    notifyListeners();
    return result;
  }

  void loadParty() async {
    final _partyList = await _ledgerMasterService.getPartyList();

    partyList = _partyList;
    notifyListeners();
  }

  void loadTransactionType() async {
    transactionTypeList = await _transactionTypeService.getList();
    notifyListeners();
  }

  int getAmount() => _amount;
  void setAmount(int value) {
    _amount = value;
    notifyListeners();
  }

  String getParticular() => _particular;
  void setParticular(String value) {
    _particular = value;
    notifyListeners();
  }

  int getBaOrBalo() => _isCredit;
  void setBaOrBalo(int value) {
    _isCredit = value;
    if (_isCredit == cCashDown) {
      _partyId = null;
      _partyName = null;
      notifyListeners();
    }
    notifyListeners();
  }

  int getCashOrBank() => _cashOrBank;
  void setCashOrBank(int value) {
    _cashOrBank = value;
    notifyListeners();
  }

  DateTime getDate() => _date;
  void setDate(DateTime value) {
    _date = value;
    notifyListeners();
  }

  int getBaType() => _creditType;
  void setBaType(int value) {
    _creditType = value;
    notifyListeners();
  }

  int getPartyId() => _partyId;
  void setPartyId(int value) {
    _partyId = value;
    print('The new party id is$_partyId');
    notifyListeners();
  }

  String getPartyName() => _partyName;
  void setPartyName(String value) {
    _partyName = value;
    notifyListeners();
  }

  int getAssetLedger() => _assetLedger;
  void setAssetLedger(int value) {
    _assetLedger = value;
    notifyListeners();
  }

  int getTransactionTypeId() => _transactionTypeId;
  void setTransactionTypeId(int value) {
    _transactionTypeId = value;
    notifyListeners();
  }

  String getTransactionTypeName() => _transactionTypeName;
  void setTransactionTypeName(String value) {
    _transactionTypeName = value;
    notifyListeners();
  }

  String getAssetLedgerName() => _assetLedgerName;
  String getDebitSideLedgerName() => _debitSideLedgerName;
  String getCreditSideLedgerName() => _creditSideLedgerName;

  //-----Mock----The Business Model--

  // Transaction _purchasemock1 = Transaction(
  //   amount:
  //   particular:
  //   isCredit:
  //   cashOrBank:
  //   date:
  //   creditType:
  //   partyId:
  //   partyName:
  //   assetLedger:
  //   transactionTypeId:
  //   transactionTypeName:
  //   debitSideLedgerId:
  //   debitSideLedgerName:
  //   creditSideLedgerId:
  //   creditSideLedgerName:
  // );
  // To Test Type -1 Purchase Transaction

  void processMockData() {
    Transaction _purchasemock1 = Transaction(
      amount: 10000,
      particular: 'Chair Leina',
      isCredit: cCredit,
      cashOrBank: BANK,
      date: DateTime.now(),
      creditType: cCredit,
      partyId: PartyMockConstant.AlexTelles,
      partyName: 'Alex Telles',
      assetLedger: AssetMockData.chair,
      transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
      transactionTypeName: 'Purchase of Asset',
    );
    //--copy parameter to variable
    _amount = _purchasemock1.amount;
    _particular = _purchasemock1.particular;
    _isCredit = _purchasemock1.isCredit;
    _cashOrBank = _purchasemock1.cashOrBank;
    _date = _purchasemock1.date;
    _creditType = _purchasemock1.creditType;
    _partyId = _purchasemock1.partyId;
    _partyName = _purchasemock1.partyName;
    _assetLedger = _purchasemock1.assetLedger;
    _transactionTypeId = _purchasemock1.transactionTypeId;
    _transactionTypeName = _purchasemock1.transactionTypeName;
    setPurchaseType();
    saveData();
  }
}
