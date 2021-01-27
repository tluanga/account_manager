import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionTypeDetailViewModel extends ChangeNotifier {
  int currentDebitSideLeger = 0;
  int currentCreditSideLedger = 0;

  List<LedgerMaster> ledgerMasterList = <LedgerMaster>[];

  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void loadData() async {
    var _listData = await _ledgerMasterService.getList();
    ledgerMasterList = _listData;
  }

  void newTransactionType(TransactionType data) async {
    var _data = await _transactionTypeService.insert(data);
    print(_data.toString());
  }

  List<DropdownMenuItem> getLedgerMasterListForSearchableDropdown() {
    // return ledgerMasterList into DropdownMenuItem
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < ledgerMasterList.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          ledgerMasterList[i].name.toString(),
        ),
        value: ledgerMasterList[i],
      ));
    }
    notifyListeners();
    return items;
  }

  int formatSumChetdanType(String value) {
    switch (value) {
      case 'Lei':
        return 0;
      case 'Hralh':
        return 1;
      case 'Lakluh':
        return 2;
      case 'Pekchhuah':
        return 3;
    }
  }
}
