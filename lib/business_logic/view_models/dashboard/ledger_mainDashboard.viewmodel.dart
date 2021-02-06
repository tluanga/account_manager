import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/material.dart';

class LedgerMainDashboardViewModel extends ChangeNotifier {
  List<LedgerMaster> ledgerMasterListSorted;
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();
  bool loadingData;

  void loadData() async {
    loadingData = true;
    ledgerMasterListSorted = await _ledgerMasterService.getTopTenLedgerList();
    loadingData = false;
    notifyListeners();
  }
}
