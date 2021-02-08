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
import 'package:account_manager/static/inWardType.constant.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/outwardType.constant.dart';
import 'package:flutter/widgets.dart';

class NewInwardTransactionViewModel extends ChangeNotifier {
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
  String _creditSideLedgerName;

  List<LedgerMaster> partyList = [];

  int _outwardType;

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

  void setInwardType() async {
    if (_cashOrBank == BANK) {
      print('Banks is selected');
      _outwardType = OutwardType.bankParty;
    } else if (_cashOrBank == CASH) {
      _outwardType = OutwardType.cashParty;
    }
  }

  void saveData() {
    _transactionService.insert(Transaction(
      amount: _amount,
      particular: _particular,
      isCredit: _isCredit,
      cashOrBank: _cashOrBank,
      date: _date, //////// la dah lo
      partyId: _partyId,
    ));
    print(_outwardType.toString());
    switch (_outwardType) {
      case InWardType.bankParty:
        {
          print('type-1:outWardBank');
          _debitSideLedgerId = LedgerID.BANK;
          _creditSideLedgerId = _partyId;
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
      case InWardType.cashParty:
        {
          print('type-2:outWardCash');
          _debitSideLedgerId = LedgerID.CASHAC;
          _creditSideLedgerId = _partyId;
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
    partyList = await _ledgerMasterService.getPartyList();

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

  void processMockData() {
    List<Transaction> _inwardMockData = [];
    //inward transaction type 1 cashdown cash
    _inwardMockData.add(
      Transaction(
        amount: 20000,
        particular: 'Rent paid by tennants',
        isCredit: cCashDown,
        cashOrBank: CASH,
        date: DateTime.now(),
        creditType: NONE,
        transactionTypeId: LedgerID.RENT,
        transactionTypeName: 'rent paid by tennants',
      ),
    );

    //inward transaction type 2 cashdown bank
    _inwardMockData.add(
      Transaction(
        amount: 20000,
        particular: 'Rent paid by tennants',
        isCredit: cCashDown,
        cashOrBank: BANK,
        date: DateTime.now(),
        creditType: NONE,
        transactionTypeId: LedgerID.RENT,
        transactionTypeName: 'rent paid by tennants',
      ),
    );

    for (int i = 0; i < _inwardMockData.length; i++) {
      _inwardMockData[i].cashOrBank.toString();

      _amount = _inwardMockData[i].amount;
      _particular = _inwardMockData[i].particular;
      _isCredit = _inwardMockData[i].isCredit;
      _cashOrBank = _inwardMockData[i].cashOrBank;
      _date = _inwardMockData[i].date;
      _creditType = _inwardMockData[i].creditType;
      _partyId = _inwardMockData[i].partyId;
      _partyName = _inwardMockData[i].partyName;
      _assetLedger = _inwardMockData[i].assetLedger;
      _transactionTypeId = _inwardMockData[i].transactionTypeId;
      _transactionTypeName = _inwardMockData[i].transactionTypeName;

      setInwardType();
      saveData();
    }
  }
}
