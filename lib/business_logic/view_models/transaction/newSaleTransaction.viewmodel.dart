import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';

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

class NewSaleTransactionViewModel extends ChangeNotifier {
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
  int _transactionTypeId = TransactionTypeConstant.cSALEOFGOODS;
  String _transactionTypeName = 'Sale of Goods'; //user input
  // ignore: unused_field
  int _debitSideLedgerId = 0; //computed-
  String _debitSideLedgerName; //computed --
//computed --
  // ignore: unused_field
  int _creditSideLedgerId = 0;
  String _creditSideLedgerName; //--computer
  // ignore: unused_field
  int _saleType;
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

  void setSaleType() async {
    if (_isCredit == cCashDown) {
      if (_cashOrBank == BANK) {
        print('1)Sale -Balo - Bank payment-');
        setDebitSideLedger(LedgerID.BANK);
        setCreditSideLedger(LedgerID.SALESAC);
        _saleType = SaleType.saleCashDownBank;
        notifyListeners();
      } else if (_cashOrBank == CASH) {
        print('2) Sale -Balo - Cash payment-');
        setDebitSideLedger(LedgerID.CASHAC);
        setCreditSideLedger(LedgerID.SALESAC);
        _saleType = SaleType.saleCashDownCash;
        notifyListeners();
      }
    } else if (_isCredit == cCredit) {
      if (_creditType != cPartialCredit) {
        print('3) Sale -Ba- ');
        setDebitSideLedger(_partyId);
        setCreditSideLedger(LedgerID.SALESAC);
        _saleType = SaleType.saleDebt;
        notifyListeners();
      } else if (_cashOrBank == CASH) {
        print('4) Sale-Ba-Partial Paymen Bank');
        setDebitSideLedger(LedgerID.BANK);
        setCreditSideLedger(LedgerID.SALESAC);
        _saleType = SaleType.saleBaPartialBank;
        notifyListeners();
      } else if (_cashOrBank == BANK) {
        print('5) Asset-Credit-Partial-Bank');
        setDebitSideLedger(LedgerID.CASHAC);
        setCreditSideLedger(LedgerID.SALESAC);
        _saleType = SaleType.saleBaPartialCash;
        notifyListeners();
      }
    }

    notifyListeners();
  }

  //-----------------------Setters----------------------------

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

    switch (_saleType) {
      case SaleType.saleCashDownBank:
        {
          print('type-1:saleCashDownBank');
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
      case SaleType.saleCashDownCash:
        {
          print('2) saleCashDownCash');
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
      case SaleType.saleDebt:
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
      case SaleType.saleBaPartialBank:
        // ---Type 4----
        {
          print('type-4:saleBaPartialBank');
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
      case SaleType.saleBaPartialCash:
        // ---Type 5----
        {
          print('type-5:saleBaPartialCash');
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
    print(_amount);
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
    List<Transaction> _saleMockData = [];
    //--copy parameter to variable
    // Sale Balo Bank payment Type 1
    // _saleMockData.add(Transaction(
    //   amount: 5000,
    //   particular: 'Chair HRalhna',
    //   isCredit: cCashDown,
    //   cashOrBank: BANK,
    //   date: DateTime.now(),
    //   creditType: NONE,
    //   transactionTypeId: TransactionTypeConstant.cSALEOFGOODS,
    // ));
    // // Sale Balo Cash payment Type 2
    // _saleMockData.add(Transaction(
    //   amount: 5000,
    //   particular: 'Chair HRalhna',
    //   isCredit: cCashDown,
    //   cashOrBank: CASH,
    //   date: DateTime.now(),
    //   creditType: NONE,
    //   transactionTypeId: TransactionTypeConstant.cSALEOFGOODS,
    // ));
    // Sale Ba (not Partial) Type 3
    _saleMockData.add(Transaction(
      amount: 3000,
      particular: 'Chair HRalhna',
      isCredit: cCredit,
      date: DateTime.now(),
      partyId: cPartyAc,
      creditType: NONE,
      transactionTypeId: TransactionTypeConstant.cSALEOFGOODS,
    ));
    //---saleBaPartialBank - Type 4
    _saleMockData.add(Transaction(
      amount: 300,
      particular: 'Bottle Hralhna',
      isCredit: cCredit,
      cashOrBank: BANK,
      partyId: cPartyAc,
      date: DateTime.now(),
      creditType: cPartialCredit,
      transactionTypeId: TransactionTypeConstant.cSALEOFGOODS,
    ));
    // ---saleBaPartialCash - Type 5
    _saleMockData.add(Transaction(
      amount: 200,
      particular: 'Bottle HRalhna',
      isCredit: cCredit,
      cashOrBank: CASH,
      partyId: cPartyAc,
      date: DateTime.now(),
      creditType: cPartialCredit,
      transactionTypeId: TransactionTypeConstant.cSALEOFGOODS,
    ));

    for (int i = 0; i < _saleMockData.length; i++) {
      _amount = _saleMockData[i].amount;
      _particular = _saleMockData[i].particular;
      _isCredit = _saleMockData[i].isCredit;
      _cashOrBank = _saleMockData[i].cashOrBank;
      _date = _saleMockData[i].date;
      _creditType = _saleMockData[i].creditType;
      _partyId = _saleMockData[i].partyId;
      _partyName = _saleMockData[i].partyName;
      _assetLedger = _saleMockData[i].assetLedger;
      _transactionTypeId = _saleMockData[i].transactionTypeId;
      _transactionTypeName = _saleMockData[i].transactionTypeName;
      print('inside mock data looop');
      print(_cashOrBank.toString());
      setSaleType();
      saveData();
    }
  }
}
