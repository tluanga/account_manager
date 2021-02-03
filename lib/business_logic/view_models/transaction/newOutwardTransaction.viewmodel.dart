import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/outwardType.constant.dart';
import 'package:flutter/widgets.dart';

class NewOutwardTransactionViewModel extends ChangeNotifier {
  int _amount;
  String _particular;
  int _isCredit = cCashDown;
  int _outwardType;
  int _debitSideLedgerId = 0;
  int _creditSideLedgerId = 0;
  int _partyId;
  int _cashOrBank = CASH;
  List<LedgerMaster> partyList = [];
  String _partyName;
  DateTime _date = DateTime.now();
  int _creditType = cCredit;
  int _transactionTypeId = 0;
  String _transactionTypeName = ''; 

  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  TransactionService _transactionService = serviceLocator<TransactionService>();
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

  void setOutwardType() async {
    if (_isCredit == cCredit) {
      // transaction type is ba
      _outwardType = OutwardType.debt;
      _debitSideLedgerId = _partyId;
      _creditSideLedgerId = , // cash/bank/ba account
    }
    else if(_isCredit == cCashDown){
      // transaction type is ba lo
      if(_cashOrBank == CASH){
        _outwardType = OutwardType.cashdowncash;
        _debitSideLedgerId = //////// 
        _creditSideLedgerId = LedgerID.CASHAC;
      }
      else if(_cashOrBank == BANK){
        _outwardType = OutwardType.cashdownbank;
        _debitSideLedgerId = ///
        _creditSideLedgerId = LedgerID.BANK;
      }
    }
  }

  void saveData(){
    _transactionService.insert(
      Transaction(
      amount: _amount,
      particular: _particular,
      isCredit: _isCredit,
      cashOrBank: _cashOrBank,
      date: _date,//////// la dah lo
      partyId: _partyId,
      )
    );

    switch (_outwardType){
      case OutwardType.cashdownbank:{
        _ledgerTransactionService.insert(
          LedgerTransaction(
            ledgerId: ,////
            amount: _amount,
            particular: _particular,
            date: _date, ///////
            debitOrCredit: DEBIT,
            cashOrBank: _cashOrBank,
          )
        );
        LedgerTransaction(
          ledgerId: LedgerID.BANK,
          amount: _amount,
          particular: _particular,
          date: _date,
          debitOrCredit: CREDIT,
          cashOrBank: _cashOrBank,
        );
      }
    }
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
        party: cPartyAc,);
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
}
