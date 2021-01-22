import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DebitSideLedgerSelectViewModel extends ChangeNotifier {
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();
  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  List<LedgerMaster> ledgerMasterList = [];

  // Populate the list
  void loadData() async {
    final _ledgerMasterList = await _ledgerMasterService.getLedgerMasterList();
    ledgerMasterList = _ledgerMasterList;
    notifyListeners();
  }

  int setDebitSideLedger(int ledgerMasterId) {
    // check ledgerId with creditSideLedgerId
    if (_transactionTypeService.getCurrentCreditSideLedger() ==
        ledgerMasterId) {
      return 0; //failure- condition fail as duplication
    }
    if (_transactionTypeService.getCurrentDebitSideLedger() == ledgerMasterId) {
      _transactionTypeService.setCurrentDebitSideLedger(0);
    }
    _transactionTypeService.setCurrentDebitSideLedger(ledgerMasterId);
    notifyListeners();
    return 1; //Success
  }

  Color setFillColorDependingOnSelection(int ledgerMasterId) {
    const debit = Color(0xFF7B74BD);
    const credit = Color(0xFF51D378);
    const unSelectd = Color(0xFFFAF5F9);
    if (_transactionTypeService.getCurrentDebitSideLedger() == ledgerMasterId) {
      return debit; //debit side selected
    } else if (_transactionTypeService.getCurrentCreditSideLedger() ==
        ledgerMasterId) {
      return credit; //credit side selected
    } else
      return unSelectd; //not selected
  }
}
