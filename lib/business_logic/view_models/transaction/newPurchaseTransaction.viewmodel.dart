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
      if (_isCredit == cCashDown) {
        if (_cashOrBank == BANK) {
          print('1) Asset-CashDown-Bank');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.BANK);

          _purchaseType = PurchaseType.assetCashDownBank;
          notifyListeners();
        } else if (_cashOrBank == BANK) {
          print('2) Asset-CashDown-Cash');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.CASHAC);
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
          _purchaseType = PurchaseType.assetDebtPartialCash;
          notifyListeners();
        } else if (_cashOrBank == BANK) {
          print('5) Asset-Credit-Partial-Bank');
          setDebitSideLedger(_assetLedger);
          setCreditSideLedger(LedgerID.BANK);
          _purchaseType = PurchaseType.assetDebtPartialBank;
          notifyListeners();
        }
      }
    } else if (_isCredit == cCashDown) {
      if (_cashOrBank == BANK) {
        print('6) Non-Asset-CashDown-Bank');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.BANK);
        _purchaseType = PurchaseType.nonAssetCashDownBank;
        notifyListeners();
      } else if (_cashOrBank == CASH) {
        print('7) Non-Asset-Cashdown-Cash-');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.CASHAC);
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
        notifyListeners();
      } else if (_cashOrBank == BANK) {
        print('10) Non-Asset-Ba-Bank Partial');
        setDebitSideLedger(LedgerID.PURCHASEAC);
        setCreditSideLedger(LedgerID.BANK);
        _purchaseType = PurchaseType.assetDebtPartialBank;
        notifyListeners();
      }
    }
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

  void setPArtyLedger(int id) async {
    _creditSideLedgerName = await _ledgerMasterService.getLedgerMasterName(id);
    _creditSideLedgerId = id;
    notifyListeners();
  }

  void setCreditType(int value) {
    _creditType = value;
    notifyListeners();
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
              amount: _amount,
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
    print('Amount:$_amount');
    print('Particular:$_particular');
    print('Ba or Balo:$_isCredit');
    print('Cash or Bank:$_cashOrBank');
    print('Ba Type:$_creditType');
    print('Party Id:$_partyId');
    print('Party Name :$_partyName');
    print('Debit Side Ledger:$_debitSideLedgerId');
    print('Credit Side Ledger:$_creditSideLedgerId');
    print('----end of print----');
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
  int getDebitSideLedgerId() => _debitSideLedgerId;
  String getCreditSideLedgerName() => _creditSideLedgerName;
  int getCreditSideLedgerID() => _creditSideLedgerId;

  Transaction journalConfirmBottomSheet() {
    print(_debitSideLedgerName);
    return Transaction(
      amount: _amount,
      debitSideLedgerName: _debitSideLedgerName,
      creditSideLedgerName: _creditSideLedgerName,
      partyName: _partyName,
      assetLedger: _assetLedger,
    );
  }

  void processMockData() {
    List<Transaction> _purchaseMockData = [];
    //--copy parameter to variable
    // ---Purchase Transaction Type -1

    // --copy parameter to variable
    // ---Purchase Transaction Type -1
    _purchaseMockData.add(Transaction(
      amount: 5000,
      particular: 'Chair Leina',
      isCredit: cCashDown,
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
        amount: 20000,
        particular: 'Chair Leina',
        isCredit: cCredit,
        cashOrBank: CASH,
        date: DateTime.now(),
        creditType: cCredit,
        partyId: PartyMockConstant.Rema,
        partyName: 'Alex Telles',
        assetLedger: AssetMockData.chair,
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
        transactionTypeName: 'Purchase of Asset',
      ),
    );

    // --Purchase Transaction Type-3
    _purchaseMockData.add(
      Transaction(
        amount: 30000,
        particular: 'Chair Leina',
        isCredit: cCredit,
        cashOrBank: NONE,
        date: DateTime.now(),
        creditType: NONE,
        partyId: PartyMockConstant.Rotluanga,
        partyName: 'Rotluanga',
        assetLedger: AssetMockData.chair,
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
        transactionTypeName: 'Purchase of Asset',
      ),
    );

    //--Purchase Transaction Type-4
    _purchaseMockData.add(
      Transaction(
        amount: 5000,
        particular: 'Eitur Leina',
        isCredit: cCashDown,
        cashOrBank: CASH,
        date: DateTime.now(),
        creditType: cCredit,
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
        transactionTypeName: 'Purchase of Non - Asset',
      ),
    );
    //--Purchase Transaction Type-5
    // debt of non asset non partial
    _purchaseMockData.add(
      Transaction(
        amount: 10000,
        particular: 'card board bat na',
        isCredit: cCredit,
        cashOrBank: BANK,
        date: DateTime.now(),
        creditType: cCredit,
        partyId: PartyMockConstant.AlexTelles,
        partyName: 'Alex Telles',
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
        transactionTypeName: 'Purchase of Raw Material',
      ),
    );

    //--Purchase Transaction Type-6
    _purchaseMockData.add(
      Transaction(
        amount: 7000,
        particular: 'Thil Hralh leh tur 7000 man leina(from Bank acc)',
        isCredit: cCashDown,
        cashOrBank: BANK,
        date: DateTime.now(),
        creditType: NONE,
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
        transactionTypeName: 'Purchase of Raw Material',
      ),
    );

    //--Purchase Transaction Type-7
    _purchaseMockData.add(
      Transaction(
        amount: 7000,
        particular: 'Thil Hralh leh tur 7000 man leina(from cash acc)',
        isCredit: cCashDown,
        cashOrBank: CASH,
        date: DateTime.now(),
        creditType: NONE,
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
        transactionTypeName: 'Purchase of Raw Material',
      ),
    );

    //--Purchase Transaction Type-8
    _purchaseMockData.add(
      Transaction(
        amount: 10000,
        particular: 'Purchase of raw material',
        isCredit: cCredit,
        cashOrBank: NONE,
        date: DateTime.now(),
        creditType: cCredit,
        partyId: PartyMockConstant.AlexTelles,
        partyName: 'Alex Telles',
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
        transactionTypeName: 'Purchase of raw material',
      ),
    );
    //--Purchase Transaction Type-9
    _purchaseMockData.add(
      Transaction(
        amount: 10000,
        particular: 'Purchase of raw Material',
        isCredit: cCredit,
        cashOrBank: CASH,
        date: DateTime.now(),
        creditType: cPartialCredit,
        partyId: PartyMockConstant.AlexTelles,
        partyName: 'Alex Telles',
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
        transactionTypeName: 'Purchase of raw Material',
      ),
    );

    //--Purchase Transaction Type-10
    _purchaseMockData.add(
      Transaction(
        amount: 10000,
        particular: 'Purchase of raw Material',
        isCredit: cCredit,
        cashOrBank: BANK,
        date: DateTime.now(),
        creditType: cPartialCredit,
        partyId: PartyMockConstant.AlexTelles,
        partyName: 'Alex Telles',
        transactionTypeId: TransactionTypeConstant.cPURCHASEOFRAWMATERIAL,
        transactionTypeName: 'Purchase of raw Material',
      ),
    );
    _purchaseMockData.add(
      Transaction(
          particular: 'Chair Leina',
          isCredit: cCredit,
          cashOrBank: CASH,
          date: DateTime.now(),
          creditType: cPartialCredit,
          partyId: PartyMockConstant.Zasiama,
          partyName: 'Zasiama',
          assetLedger: AssetMockData.chair,
          transactionTypeId: TransactionTypeConstant.cPURCHASEOFASSET,
          transactionTypeName: 'Purchase of Asset'),
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
      print('inside mock data looop');
      print(_cashOrBank.toString());
      setPurchaseType();
      saveData();
    }
  }
}
