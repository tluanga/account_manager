import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/purchaseType.constant.dart';

import 'package:flutter/foundation.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import '../../models/transactionType.models.dart';

import '../../../services/transaction/transaction.service.dart';

import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';

class NewSellTransactionViewModel extends ChangeNotifier {
  int _amount;
  String _particular; //--user input
  int _isCredit = cCashDown; //user input
  int _cashOrBank = CASH; //user input
  DateTime _date = DateTime.now(); //user input
  int _baType = cCredit; //BA partial or Full --user input
  int _partyId; //user purchase is made by BA
  String _partyName; //Computed
  int _assetLedger; //if the purchase is of asset//user input
  String _assetLedgerName;
  int _transactionTypeId; //user input
  int _debitSideLedgerId; //computed-
  String _debitSideLedgerName; //computed --
  int _creditSideLedgerId; //computed --
  // ignore: unused_field
  String _creditSideLedgerName; //--computer
  int _purchaseType;
  List<LedgerMaster> partyList = [];

  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  TransactionService _transactionService = serviceLocator<TransactionService>();
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void setSaleType() {
    if (_assetLedger != null) {
      if (_isCredit == cCredit) {
        //Transaction is Ba
        if (_baType == cCredit) {
          print('assetBa Full = 3');
          _creditSideLedgerId = _partyId;
          _purchaseType = PurchaseType.assetDebt;
        } else {
          if (_cashOrBank == CASH) {
            print('assetBaCashPartial = 4');
            _creditSideLedgerId = LedgerID.CASHAC;
            _purchaseType = PurchaseType.assetDebtCashPartial;
          } else if (_cashOrBank == BANK) {
            print('assetBaBankPartial = 5');
            _creditSideLedgerId = LedgerID.BANK;
            _purchaseType = PurchaseType.assetDebtBankPartial;
          }
        }
      }
      if (_isCredit == cCashDown) {
        //transaction Type is Balo
        if (_cashOrBank == CASH) {
          //Transaction Type is Cash
          print('assetBaloCash = 2');
          _creditSideLedgerId = LedgerID.CASHAC;
          _purchaseType = PurchaseType.cashDownCash;
        } else if (_cashOrBank == BANK) {
          //Transaction Type is Bank
          print('assetBaloBank = 1');
          _creditSideLedgerId = LedgerID.BANK;
          _purchaseType = PurchaseType.cashDownBank;
        }
      } else {
        _debitSideLedgerId = LedgerID.PURCHASEAC;
        if (_isCredit == cCredit) {
          //Transaction is Ba
          if (_baType == cCredit) {
            print('nonAssetBa = 8');
            _creditSideLedgerId = _partyId;
            _purchaseType = PurchaseType.nonAssetDebt;
          } else {
            if (_cashOrBank == CASH) {
              print('nonAssetBaCashPartial = 9');
              _creditSideLedgerId = LedgerID.CASHAC;
              _purchaseType = PurchaseType.nonAssetDebtCashPartial;
            } else if (_cashOrBank == BANK) {
              print('nonAssetBaBankPartial = 10');
              _creditSideLedgerId = LedgerID.BANK;
              _purchaseType = PurchaseType.nonAssetDebtBankPartial;
            }
          }
        }
        if (_isCredit == cCashDown) {
          //transaction Type is Balo
          if (_cashOrBank == CASH) {
            //Transaction Type is Cash
            print('nonAssetBaloCash = 7');
            _creditSideLedgerId = LedgerID.CASHAC;
            _purchaseType = PurchaseType.nonAssetCashDownCash;
          } else if (_cashOrBank == BANK) {
            //Transaction Type is Bank
            print('nonAssetBaloBank = 6');
            _creditSideLedgerId = LedgerID.BANK;
            _purchaseType = PurchaseType.nonAssetCashDownBank;
          }
        }
      }
    }
  }

  void saveData() {
    // Asset a nih chuan debit ah assetLedger
    // Asset a nih loh chuan Purchase Ac
    if (_assetLedger == cCredit) {
    } else {}
  }

  void printData() {
    print('Amount:$_amount');
    print('Particular:$_particular');
    print('Ba or Balo:$_isCredit');
    print('Cash or Bank:$_cashOrBank');
    print('Ba Type:$_baType');
    print('Party Id:$_partyId');
    print('Party Name :$_partyName');
  }

  Future<List<LedgerMaster>> getFilterdPartyLedgerMaster(
      String _searchString) async {
    List<LedgerMaster> _ledgerMasterList =
        await _ledgerMasterService.getFilterdPartyLedgerList(_searchString);
    print(_searchString);
    String _length = _ledgerMasterList.length.toString();
    print('The search Returned $_length result in the viewmodel');
    return _ledgerMasterList;
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
    return result;
  }

  void loadParty() async {
    final _partyList = await _ledgerMasterService.getPartyList();

    partyList = _partyList;
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

  int getBaType() => _baType;
  void setBaType(int value) {
    _baType = value;
    notifyListeners();
  }

  int getPartyId() => _partyId;
  void setPartyId(int value) {
    _partyId = value;
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

  String getAssetLedgerName() => _assetLedgerName;
  String getDebitSideLedgerName() => _debitSideLedgerName;
  String getCreditSideLedgerName() => _creditSideLedgerName;
}
