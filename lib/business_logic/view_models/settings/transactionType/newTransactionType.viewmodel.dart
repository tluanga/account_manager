import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewTransactionTypeViewModel extends ChangeNotifier {
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
          ledgerMasterList[i].name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        value: ledgerMasterList[i].id.toString(),
      ));
    }
    // notifyListeners();
    return items;
  }

  int formatSumChetdanType(String value) {
    int _value;
    switch (value) {
      case 'Lei':
        _value = 0;
        break;
      case 'Hralh':
        _value = 1;
        break;
      case 'Lakluh':
        _value = 2;
        break;
      case 'Pekchhuah':
        _value = 3;
        break;
    }
    return _value;
  }
}
