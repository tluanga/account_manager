import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/assetMockData.constant.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';
import 'package:account_manager/static/partyMock.constant.dart';
import 'package:account_manager/static/purchaseType.constant.dart';
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
    if (_assetLedger != null) {
      //Transaction type is asset
      _debitSideLedgerId = _assetLedger;
      if (_isCredit == cCredit) {
        //Transaction is Ba
        if (_creditType == cCredit) {
          print('assetBa Full = 3');
          _purchaseType = PurchaseType.assetDebt;
          _debitSideLedgerId = _assetLedger;
          _creditSideLedgerId = _partyId;
        } else {
          if (_cashOrBank == CASH) {
            print('assetBaCashPartial = 4');
            _purchaseType = PurchaseType.assetDebtCashPartial;
            _debitSideLedgerId = _assetLedger;
            _creditSideLedgerId = LedgerID.CASHAC;
          } else if (_cashOrBank == BANK) {
            print('assetBaBankPartial = 5');
            _purchaseType = PurchaseType.assetDebtBankPartial;
            _debitSideLedgerId = _assetLedger;
            _creditSideLedgerId = LedgerID.CASHAC;
          }
        }
      }
      if (_isCredit == cCashDown) {
        //transaction Type is Balo
        if (_cashOrBank == CASH) {
          //Transaction Type is Cash
          print('assetBaloCash = 2');
          _purchaseType = PurchaseType.assetCashDownCash;
          _debitSideLedgerId = _assetLedger;
          _creditSideLedgerId = LedgerID.CASHAC;
        } else if (_cashOrBank == BANK) {
          //Transaction Type is Bank
          print('assetBaloBank = 1');
          _purchaseType = PurchaseType.assetCashDownBank;
          _debitSideLedgerId = _assetLedger;
          _creditSideLedgerId = LedgerID.BANK;
        }
      } else {
        _debitSideLedgerId = LedgerID.PURCHASEAC;
        if (_isCredit == cCredit) {
          //Transaction is Ba
          if (_creditType == cCredit) {
            print('nonAssetDebt = 8');
            _purchaseType = PurchaseType.nonAssetDebt;
            _debitSideLedgerId = LedgerID.PURCHASEAC;
            _creditSideLedgerId = _partyId;
          } else {
            if (_cashOrBank == CASH) {
              print('nonAssetDebtCashPartial = 9');
              _purchaseType = PurchaseType.nonAssetDebtCashPartial;
              _debitSideLedgerId = LedgerID.PURCHASEAC;
              _creditSideLedgerId = LedgerID.CASHAC;
            } else if (_cashOrBank == BANK) {
              print('nonAssetDebtBankPartial = 10');
              _purchaseType = PurchaseType.nonAssetDebtBankPartial;
              _debitSideLedgerId = LedgerID.PURCHASEAC;
              _creditSideLedgerId = LedgerID.BANK;
            }
          }
        }
        if (_isCredit == cCashDown) {
          //transaction Type is Balo
          if (_cashOrBank == CASH) {
            //Transaction Type is Cash
            print('nonAssetBaloCash = 7');
            _purchaseType = PurchaseType.nonAssetCashDownCash;
            _debitSideLedgerId = LedgerID.PURCHASEAC;
            _creditSideLedgerId = LedgerID.CASHAC;
          } else if (_cashOrBank == BANK) {
            //Transaction Type is Bank
            print('nonAssetBaloBank = 6');
            _purchaseType = PurchaseType.nonAssetCashDownBank;
            _debitSideLedgerId = LedgerID.PURCHASEAC;
            _creditSideLedgerId = LedgerID.BANK;
          }
        }
      }
    }
    _debitSideLedgerName =
        await _ledgerMasterService.getLedgerMasterName(_debitSideLedgerId);
    _creditSideLedgerName =
        await _ledgerMasterService.getLedgerMasterName(_creditSideLedgerId);
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

    switch (_purchaseType) {
      case PurchaseType.assetCashDownBank:
        {
          // --process debit side
          print('type-1:assetCashDownBank');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.BANK,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case PurchaseType.assetCashDownCash:
        {
          print('type-2:assetCashDownCash');
          // --process debit side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.CASHAC,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case PurchaseType.assetDebt:
        // ---Type 3----
        {
          print('type-3:assetDebt');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
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
        }
        break;
      case PurchaseType.assetDebtCashPartial:
        // ---Type 4----
        {
          print('type-4:assetDebtCashPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.CASHAC,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
          //process credit side-party ac
          LedgerTransaction(
            ledgerId: _partyId,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case PurchaseType.assetDebtBankPartial:
        // ---Type 5----
        {
          print('type-5:assetDebtBankPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: _assetLedger,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.BANK,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
          //process credit side-party ac
          LedgerTransaction(
            ledgerId: _partyId,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case PurchaseType.nonAssetCashDownBank:
        {
          print('type-6:nonAssetCashDownBank');
          //-----6-----------
          // --process debit side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.PURCHASEAC,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.BANK,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case PurchaseType.nonAssetCashDownCash:
        {
          //----------7-------------
          print('type-7:nonAssetCashDownCash');
          // --process debit side
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.PURCHASEAC,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.CASHAC,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
        }
        break;
      case PurchaseType.nonAssetDebt:
        // ---Type 8----
        {
          print('type-8:nonAssetDebt');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.PURCHASEAC,
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
        }
        break;
      case PurchaseType.nonAssetDebtCashPartial:
        // ---Type 9----
        {
          print('type-9:nonAssetDebtCashPartial');
          _ledgerTransactionService.insert(
            LedgerTransaction(
              ledgerId: LedgerID.PURCHASEAC,
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.CASHAC,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
          //process credit side-party ac
          LedgerTransaction(
            ledgerId: _partyId,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
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
              amount: _amount,
              particular: _particular,
              date: _date,
              debitOrCredit: DEBIT,
              cashOrBank: _cashOrBank,
            ),
          );
          //process credit Side
          LedgerTransaction(
            ledgerId: LedgerID.BANK,
            amount: _amount,
            particular: _particular,
            date: _date,
            debitOrCredit: CREDIT,
            cashOrBank: _cashOrBank,
          );
          //process credit side-party ac
          LedgerTransaction(
            ledgerId: _partyId,
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
    List<Transaction> _purchaseMockData = [];
    //--copy parameter to variable
    //---Purchase Transaction Type -1
    _purchaseMockData.add(Transaction(
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
    ));

    //--Purchase Transaction Type-2
    _purchaseMockData.add(
      Transaction(
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
      ),
    );

    //--Purchase Transaction Type-3
    _purchaseMockData.add(
      Transaction(
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
      ),
    );

    //--Purchase Transaction Type-4
    _purchaseMockData.add(
      Transaction(
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
      ),
    );
    //--Purchase Transaction Type-5
    _purchaseMockData.add(
      Transaction(
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
      ),
    );

    //--Purchase Transaction Type-6
    _purchaseMockData.add(
      Transaction(
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
      ),
    );

    //--Purchase Transaction Type-7
    _purchaseMockData.add(
      Transaction(
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
      ),
    );

    //--Purchase Transaction Type-8
    _purchaseMockData.add(
      Transaction(
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
      ),
    );
    //--Purchase Transaction Type-9
    _purchaseMockData.add(
      Transaction(
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
      ),
    );

    //--Purchase Transaction Type-10
    _purchaseMockData.add(
      Transaction(
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
      ),
    );
    for (int i = 0; i < _purchaseMockData.length; i++) {
      _amount = _purchaseMockData[i].amount;
      _particular = _purchaseMockData[i].particular;
      _isCredit = _purchaseMockData[i].isCredit;
      _cashOrBank = _purchaseMockData[i].cashOrBank;
      _date = _purchaseMockData[i].date;
      _creditType = _purchaseMockData[i].creditType;
      _partyId = _purchaseMockData[i].partyId;
      _partyName = _purchaseMockData[i].partyName;
      _assetLedger = _purchaseMockData[i].assetLedger;
      _transactionTypeId = _purchaseMockData[i].transactionTypeId;
      _transactionTypeName = _purchaseMockData[i].transactionTypeName;
      setPurchaseType();
      saveData();
    }
  }
}
