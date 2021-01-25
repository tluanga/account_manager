import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';

class NewTransactionTypeViewModel extends ChangeNotifier {
  int currentDebitSideLeger = 0;
  int currentCreditSideLedger = 0;
  List<LedgerMaster> _ledgerMasterList = <LedgerMaster>[];

  TransactionTypeService _transactionTypeService =
      serviceLocator<TransactionTypeService>();

  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void loadData() async {
    var _listData = await _ledgerMasterService.getList();
    _ledgerMasterList = _listData;
  }

  void newTransactionType(TransactionType data) async {
    var _data = await _transactionTypeService.insert(data);
    print(_data.toString());
  }
}
