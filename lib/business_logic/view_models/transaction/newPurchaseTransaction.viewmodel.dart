import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/static/ledgerId.constants.dart';

import 'package:flutter/foundation.dart';

import 'package:account_manager/services/transactionType/transactionType.service.dart';
import '../../models/transactionType.models.dart';

import '../../../services/transaction/transaction.service.dart';

import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';

class NewPurchaseTransactionViewModel extends ChangeNotifier {
  int _amount;
  String _particular; //--user input
  int _baOrBalo = cBALO; //user input
  int _cashOrBank = CASH; //user input
  DateTime _date; //user input
  int _baType = cFullBA; //BA partial or Full --user input
  int _party; //user purchase is made by BA
  String _partyName; //Computed
  int _assetLedger; //if the purchase is of asset//user input
  String _assetLedgerName;
  int _transactionTypeId; //user input
  int _debitSideLedgerId; //computed-
  String _debitSideLedgerName; //computed --
  int _creditSideLedgerId; //computed --
  // ignore: unused_field
  String _creditSideLedgerName; //--computer

  List<LedgerMaster> partyList = [];

  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();
  TransactionService _transactionService = serviceLocator<TransactionService>();
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void setData() async {
    var _transactionTypeResult = await _transactionTypeService.getList(id: 1);

    if (_transactionTypeResult == null) {
      print('Transaction Type access fail');
    } else
      print(_transactionTypeResult.toString());
    TransactionType _transationType = _transactionTypeResult[0];
    String _transactionTypeName = _transationType.name;
    print('Transaction Type name $_transactionTypeName');

    // ----IF asset is bought it will go to debitsite
    if (_assetLedger != null) {
      _debitSideLedgerId = _assetLedger;
      if (_party != null && _baType == cFullBA) {
        _creditSideLedgerId = _party;
        LedgerMaster ledgerMaster =
            await _ledgerMasterService.getLedgerMaster(_creditSideLedgerId);
        _creditSideLedgerName = ledgerMaster.name;
      } else if (_party != null && _baType == cPartialBA) {
        if (_cashOrBank == CASH) {
          _creditSideLedgerId = _transationType.creditSideLedger;
          LedgerMaster ledgerMaster =
              await _ledgerMasterService.getLedgerMaster(_creditSideLedgerId);
          _creditSideLedgerName = ledgerMaster.name;
        }
      }
    } else if (_assetLedger == null) {
      print('Not an asset');
      _debitSideLedgerId = _transationType.debitSideLedger;
      LedgerMaster ledgerMaster =
          await _ledgerMasterService.getLedgerMaster(_debitSideLedgerId);
      String _ledgerMasterName = ledgerMaster.name;
      print('Debit Side LedgerName $_ledgerMasterName');
      _debitSideLedgerName = ledgerMaster.name;
      if (_party != null && _baType == cFullBA) {
        // Ba full a nih chuan
        // creditside ah partyLedger
        print('Party is not Null and Ba type is full');
        _creditSideLedgerId = _party;
        LedgerMaster ledgerMaster =
            await _ledgerMasterService.getLedgerMaster(_creditSideLedgerId);
        _creditSideLedgerName = ledgerMaster.name;
      } else if (_party != null && _baType == cPartialBA) {
        // Partial Ba ah
        // Credit Side ah Bank or Cash
        print('Party is not Null and Ba type is partial');
        if (_cashOrBank == CASH) {
          print(
              'Party is not Null and Ba type is partial, transaction is Cash');
          _creditSideLedgerId = _transationType.creditSideLedger;
          LedgerMaster ledgerMaster =
              await _ledgerMasterService.getLedgerMaster(LedgerID.CASHAC);
          _creditSideLedgerName = ledgerMaster.name;
        } else if (_cashOrBank == BANK) {
          print(
              'Party is not Null and Ba type is partial, transaction is Bank');
          _creditSideLedgerId = _transationType.creditSideLedger;
          LedgerMaster ledgerMaster =
              await _ledgerMasterService.getLedgerMaster(LedgerID.BANK);
          _creditSideLedgerName = ledgerMaster.name;
        }
      } else {
        //Ba lo a thil lei in
        _creditSideLedgerId = _transationType.creditSideLedger;
        LedgerMaster ledgerMaster =
            await _ledgerMasterService.getLedgerMaster(LedgerID.CASHAC);
        _creditSideLedgerName = ledgerMaster.name;
      }
    }
  }

  // // ---For creating a new transaction
  // void newTransaction({
  //   int amount,
  //   String particulars,
  //   DateTime date,
  //   int baOrBalo,
  //   int cashOrBank,
  //   int transactionTypeId,
  //   int partyAccount = 0,
  // } //Ba a thil lei a nih in party ledger account id a ngai
  //     ) async {
  //   // 1 -- save the transaction
  //   var _result = await _transactionService.insert(
  //     Transaction(
  //       amount: amount,
  //       date: DateTime.now(),
  //       particular: particulars,
  //       baOrBalo: baOrBalo,
  //       cashOrBank: cashOrBank,
  //       transactionTypeId: transactionTypeId,
  //     ),
  //   );
  //   if (_result != null) {
  //     print('New transaction Inserted-$_result');
  //   }
  //   // 2---Get Transaction type Object
  //   var _transactionTypeResult = await _transactionTypeService.getList(id: 1);
  //   if (_transactionTypeResult == null) {
  //     print('Transaction Type access fail');
  //   } else
  //     print(_transactionTypeResult.toString());

  //   // 3----CREDIT SIDE LEDGER
  //   // --------Check for Cash or Bank
  //   // -------Get Bank Ledger ID--------
  //   TransactionType _transationType = _transactionTypeResult[0];

  //   if (cashOrBank == BANK) {
  //     LedgerTransaction _ledgerTransactionCreditPayload = LedgerTransaction(
  //       ledgerId: 1, //Ledger ID of Bank Ledger is 1
  //       amount: amount,
  //       particular: particulars,
  //       debitOrCredit: CREDIT,
  //       date: date,
  //     );
  //     _ledgerTransactionService.insert(_ledgerTransactionCreditPayload);
  //   } else if (cashOrBank == CASH) {
  //     LedgerTransaction _ledgerTransactionCreditPayload = LedgerTransaction(
  //       ledgerId: _transationType.creditSideLedger,
  //       amount: amount,
  //       particular: particulars,
  //       debitOrCredit: CREDIT,
  //       date: date,
  //     );
  //     _ledgerTransactionService.insert(_ledgerTransactionCreditPayload);
  //   }

  //   // 4- Create a ledgerTransaction entry for debitSideLedger
  //   if (baOrBalo == cBALO) {
  //     LedgerTransaction _ledgerTransactionDebitPayload = LedgerTransaction(
  //       ledgerId: _transationType.debitSideLedger,
  //       amount: amount,
  //       particular: particulars,
  //       debitOrCredit: DEBIT,
  //       date: date,
  //     );
  //     _ledgerTransactionService.insert(_ledgerTransactionDebitPayload);
  //   } else if (baOrBalo == cBA) {
  //     LedgerTransaction _ledgerTransactionDebitPayload = LedgerTransaction(
  //       ledgerId: partyAccount,
  //       amount: amount,
  //       particular: particulars,
  //       debitOrCredit: DEBIT,
  //       date: date,
  //     );
  //     _ledgerTransactionService.insert(_ledgerTransactionDebitPayload);
  //   }
  // }

  Future<int> createPartyLedger({name, description}) async {
    var payload = LedgerMaster(name: name, description: description);
    var result = await _ledgerMasterService.insert(payload);
    return result;
  }

  void loadParty() async {
    final _partyList = await _ledgerMasterService.getPartyList();

    partyList = _partyList;
  }

  int getAmount() => _amount;
  void setAmount(int value) => _amount = value;

  String getParticular() => _particular;
  void setParticular(String value) => _particular = value;

  int getBaOrBalo() => _baOrBalo;
  void setBaOrBalo(int value) => _baOrBalo = value;

  int getCashOrBank() => _cashOrBank;
  void setCashOrBank(int value) => _cashOrBank = value;

  DateTime getDate() => _date;
  void setDate(DateTime value) => _date = value;

  int getBaType() => _baType;
  void setBaType(int value) => _baType = value;

  int getParty() => _baType;
  void setParty(int value) => _party = value;

  int getAssetLedger() => _assetLedger;
  void setAssetLedger(int value) => _assetLedger = value;

  int getTransactionTypeId() => _transactionTypeId;
  void setTransactionTypeId(int value) => _transactionTypeId = value;

  String getPartyName() => _partyName;
  String getAssetLedgerName() => _assetLedgerName;
  String getDebitSideLedgerName() => _debitSideLedgerName;
  String getCreditSideLedgerName() => _creditSideLedgerName;
}
