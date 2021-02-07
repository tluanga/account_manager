import 'package:flutter/foundation.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';

class LedgerDashboardViewmodel extends ChangeNotifier {
  //Instantiate the ledgerMasterService
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  List<LedgerMaster> ledgerMasterList = [];
  int totalDebit = 0;
  int totalCredit = 0;

  // Populate the list
  void loadData() async {
    final _ledgerMasterList = await _ledgerMasterService.getList();
    ledgerMasterList = _ledgerMasterList;
    notifyListeners();
  }

  void searchLedgerMaster(String _searchString) async {
    ledgerMasterList =
        await _ledgerMasterService.getFilterdLedgerList(_searchString);
    notifyListeners();
  }
}
