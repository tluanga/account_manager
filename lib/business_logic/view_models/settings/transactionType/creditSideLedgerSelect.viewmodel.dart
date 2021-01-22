import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/foundation.dart';

class CreditSideLedgerSelectViewModel extends ChangeNotifier {
  final int mode = DEBIT;
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  List<LedgerMaster> ledgerList = [];

  void loadData() async {
    final _list = await _ledgerMasterService.getLedgerMasterList();
    ledgerList = _list;
    notifyListeners();
  }

  int setDebitSideLedger(int ledgerMasterId) {
    // check ledgerId with creditSideLedgerId
    if (_transactionTypeService.getCurrentCreditSideLedger() ==
        ledgerMasterId) {
      return 0; //failure- condition fail as duplication
    }
    _transactionTypeService.setCurrentDebitSideLedger(ledgerMasterId);
    notifyListeners();
    return 1; //Success
  }

  int checkLedgerForSelect(int ledgerMasterId) {
    if (_transactionTypeService.getCurrentDebitSideLedger() == ledgerMasterId) {
      return DEBIT; //debit side selected
    } else if (_transactionTypeService.getCurrentCreditSideLedger() ==
        ledgerMasterId) {
      return CREDIT; //credit side selected
    } else
      return NONE; //not selected
  }
}