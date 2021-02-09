import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/transaction.model.dart';

import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transaction/transaction.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/purchaseType.constant.dart';

import 'package:flutter/foundation.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';

import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';

import '../../../static/constants.dart';

class NewPurchaseTransactionViewModel extends ChangeNotifier {
  int _debitAmount;
  int _creditAmount;
  int _creditPartialPaymentBankOrCash;

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
  int _purchaseType;
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

  void setupPurchase() async {
    //--------Set Purchase type--------
    if (_assetLedger != null) {
      if (_isCredit == cCashDown) {
        if (_cashOrBank == BANK) {
          print('1) Asset-CashDown-Bank');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.BANK);
          setPartyId(null);
          _purchaseType = PurchaseType.assetCashDownBank;
          notifyListeners();
        } else if (_cashOrBank == CASH) {
          print('2) Asset-CashDown-Cash');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.CASHAC);
          setPartyId(null);
          _purchaseType = PurchaseType.assetCashDownCash;
          notifyListeners();
        }
      } else if (_isCredit == cCredit) {
        if (_creditType != cPartialCredit) {
          print('3) Asset-Credit');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(_partyId);
          _purchaseType = PurchaseType.assetDebt;
          notifyListeners();
        } else if (_cashOrBank == CASH) {
          print('4) Asset-Credit-Partial-Cash');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.CASHAC);
          setCreditAmount();
          _purchaseType = PurchaseType.assetDebtPartialCash;
          notifyListeners();
        } else if (_cashOrBank == BANK) {
          print('5) Asset-Credit-Partial-Bank');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.BANK);
          _purchaseType = PurchaseType.assetDebtPartialBank;
          setCreditAmount();
          notifyListeners();
        }
      }
    } else if (_isCredit == cCashDown) {
      if (_cashOrBank == BANK) {
        print('6) Non-Asset-CashDown-Bank');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.BANK);
        setPartyId(null);
        _purchaseType = PurchaseType.nonAssetCashDownBank;
        notifyListeners();
      } else if (_cashOrBank == CASH) {
        print('7) Non-Asset-Cashdown-Cash-');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.CASHAC);
        setPartyId(null);
        _purchaseType = PurchaseType.nonAssetCashDownCash;
        notifyListeners();
      }
    } else if (_isCredit == cCredit) {
      if (_creditType != cPartialCredit) {
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(_partyId);
        print('8) Non-Asset-Credit-');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(_partyId);
        _purchaseType = PurchaseType.nonAssetDebt;
        notifyListeners();
      } else if (_cashOrBank == CASH) {
        print('9) Non-Asset-Credit-Cash Partial');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.CASHAC);
        _purchaseType = PurchaseType.nonAssetDebtCashPartial;
        setCreditAmount();
        notifyListeners();
      } else if (_cashOrBank == BANK) {
        print('10) Non-Asset-Ba-Bank Partial');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.BANK);
        setCreditAmount();
        _purchaseType = PurchaseType.assetDebtPartialBank;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  void setCreditAmount() {
    // if partial payment exist
    if (_creditType == cPartialCredit) {
      //set the credit amount
      print('Partial Payment');
      _creditAmount = _debitAmount - _creditPartialPaymentBankOrCash;
      notifyListeners();
    } else {
      print('full Payment');
      _creditAmount = _debitAmount;
      notifyListeners();
    }
  }

  void saveData() {
    _transactionService.insert(
      Transaction(
        amount: _debitAmount,
        particular: _particular,
        isCredit: _isCredit,
        cashOrBank: _cashOrBank,
        date: _date,
        creditType: _creditType,
        partyId: _partyId,
        partyName: _partyName,
        assetLedger: _assetLedger,
        assetLedgerName: _assetLedgerName,
        transactionTypeId: _transactionTypeId,
        debitSideLedgerId: _debitSideLedgerId,
        debitSideLedgerName: _debitSideLedgerName,
        creditSideLedgerId: _creditSideLedgerId,
        creditSideLedgerName: _creditSideLedgerName,
        transactionTypeName: _transactionTypeName,
      ),
    );

    switch (_purchaseType) {
      case PurchaseType.assetCashDownBank:
        {
          print('type-1:assetCashDownBank');
          // --process debit side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _creditAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.assetCashDownCash:
        {
          print('2) assetCashDownCash');
          // --process debit side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _creditAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.assetDebt:
        // ---Type 3----
        {
          print('3)Save Data- Asset-Credit--');
          // --process debit side
          print('---Before Saving data----');
          print('_debitSideLedgerId:$_debitSideLedgerId');
          print('_creditSideLedgerId:$_creditSideLedgerId');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _creditAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.assetDebtPartialCash:
        // ---Type 4----
        {
          print('type-4:assetDebtCashPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.CASHAC,
              amount: _creditPartialPaymentBankOrCash,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit side-party ac
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _partyId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.assetDebtPartialBank:
        // ---Type 5----
        {
          print('type-5:assetDebtBankPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.BANK,
              amount: _creditPartialPaymentBankOrCash,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit side-party ac
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _partyId,
              amount: _creditAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.nonAssetCashDownBank:
        {
          print('type-6:nonAssetCashDownBank');
          // --process debit side

          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.nonAssetCashDownCash:
        {
          print('type-7) Non-Asset-Cashdown-Cash-');
          // --process debit side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.nonAssetDebt:
        // ---Type 8----
        {
          print('type-8:Non-Asset-Credit-');

          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _debitSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _creditSideLedgerId,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.nonAssetDebtCashPartial:
        // ---Type 9----
        {
          print('type-9:nonAssetDebtCashPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.PURCHASEAC,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.CASHAC,
              amount: _creditPartialPaymentBankOrCash,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit side-party ac
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _partyId,
              amount: _creditAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
      case PurchaseType.nonAssetDebtBankPartial:
        // ---Type 10----
        {
          print('type-10:nonAssetDebtBankPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.PURCHASEAC,
              amount: _debitAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit Side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.BANK,
              amount: _creditPartialPaymentBankOrCash,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
          //process credit side-party ac
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _partyId,
              amount: _creditAmount,
              particular: _particular,
              date: _date,
              debitOrCredit: CREDIT,
              cashOrBank: _cashOrBank,
              transactionTypeId: _transactionTypeId,
            ),
          );
        }
        break;
    }
  }

  void printData() {
    print('-------Start of Print----');
    print('Amount:$_debitAmount');
    print('Particular:$_particular');
    print('Ba or Balo:$_isCredit');
    print('Cash or Bank:$_cashOrBank');
    print('Ba Type:$_creditType');
    print('Party Id:$_partyId');
    print('Party Name :$_partyName');
    print('Debit Side Ledger:$_debitSideLedgerId');
    print('Credit Side Ledger:$_creditSideLedgerId');
    print('Is Credit:$_isCredit');
    print('----end of print----');
  }

  int getDebitAmount() => _debitAmount;
  void setDebitAmount(int value) {
    _debitAmount = value;
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

    notifyListeners();
  }

  String getPartyName() => _partyName;
  void setPartyName(String value) {
    _partyName = value;
    notifyListeners();
  }

  int getAssetLedger() => _assetLedger;

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

  void setDebitSideLedger(int id) async {
    _debitSideLedgerName = await _ledgerMasterService.getLedgerMasterName(id);
    _debitSideLedgerId = id;
    notifyListeners();
  }

  void setCreditSideLedger(int id) async {
    _creditSideLedgerName = await _ledgerMasterService.getLedgerMasterName(id);
    _creditSideLedgerId = id;
    notifyListeners();
  }

  void setAssetLedger(int id) async {
    _assetLedgerName = await _ledgerMasterService.getLedgerMasterName(id);
    _assetLedger = id;
    notifyListeners();
  }

  void setPartyLedger(int id) async {
    _creditSideLedgerName = await _ledgerMasterService.getLedgerMasterName(id);
    _creditSideLedgerId = id;
    notifyListeners();
  }

  void setCreditType(int value) {
    _creditType = value;
    notifyListeners();
  }

  int getCreditBankCashPartialPayment() => _creditPartialPaymentBankOrCash;
  void setCreditBankCashPartialPayment(int value) {
    _creditPartialPaymentBankOrCash = value;
    notifyListeners();
  }

  String getAssetLedgerName() => _assetLedgerName;
  String getDebitSideLedgerName() => _debitSideLedgerName;
  int getDebitSideLedgerId() => _debitSideLedgerId;
  String getCreditSideLedgerName() => _creditSideLedgerName;
  int getCreditSideLedgerID() => _creditSideLedgerId;
  int getCreditAmount() => _creditAmount;

  Transaction journalConfirmBottomSheet() {
    print(_debitSideLedgerName);
    return Transaction(
      amount: _debitAmount,
      debitSideLedgerName: _debitSideLedgerName,
      creditSideLedgerName: _creditSideLedgerName,
      partyName: _partyName,
      assetLedger: _assetLedger,
    );
  }
}
