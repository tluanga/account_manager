import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  int setCreditSideLedger(int ledgerMasterId) {
    // check ledgerId with creditSideLedgerId
    if (_transactionTypeService.getCurrentDebitSideLedger() == ledgerMasterId) {
      return 0; //failure- condition fail as duplication
    }
    if (_transactionTypeService.getCurrentCreditSideLedger() ==
        ledgerMasterId) {
      _transactionTypeService.setCurrentCreditSideLedger(0);
    }
    _transactionTypeService.setCurrentCreditSideLedger(ledgerMasterId);
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

  String getDebitSideLedger() {
    return _transactionTypeService.getCurrentDebitSideLedger().toString();
  }

  String getCreditSideLedger() {
    return _transactionTypeService.getCurrentCreditSideLedger().toString();
  }
}
